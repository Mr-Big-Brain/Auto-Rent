table 50155 "Auto Rent Header"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Header';
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(10; "Client No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Client No.';
            TableRelation = Customer;
            trigger OnValidate()
            var
                CustLedgerEntry: Record "Cust. Ledger Entry";
                Cust: Record Customer;
                ErrorLbl1: Label 'This client has debt';
                ErrorLbl2: Label 'This client is blocked';
            begin
                CustLedgerEntry.SetRange("Customer No.", Rec."Client No.");
                if CustLedgerEntry.FindSet() then
                    repeat
                        CustLedgerEntry.CALCFIELDS(Amount);
                        if (CustLedgerEntry.Amount < 0) then begin
                            Error(ErrorLbl1);
                        end;
                    until CustLedgerEntry.Next() = 0;
                Cust.SetRange(Cust."No.", rec."Client No.");
                if (Cust.FindSet()) then begin
                    if (Cust.Blocked <> Cust.Blocked::" ") then begin
                        Error(ErrorLbl2);
                    end;
                end;
                ProhibitInsertIfReleased();
            end;
        }
        field(11; "Driver License"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Driver License';
            Subtype = Bitmap;
            trigger OnValidate()
            begin
                ProhibitInsertIfReleased();
            end;
        }
        field(12; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;
            trigger OnValidate()
            var
                AutoRentLine: Record "Auto Rent Line";
                Auto: Record Auto;
                AutoLineHelp: Record "Auto Rent Line";
                DescriptionLbl: Label 'Defaul car price per day';
            begin
                ProhibitInsertIfReleased();
                if (Rec.Status = Rec.Status::Open) then begin
                    AutoLineHelp.SetRange("Document No.", "No.");
                    AutoLineHelp.SetRange("Line No.", 10000);
                    if AutoLineHelp.FindSet() then begin
                        AutoLineHelp.Delete();
                    end;

                    Auto.SetRange("No.", Rec."Auto No.");
                    Auto.FindFirst();
                    AutoRentLine.Init;
                    AutoRentLine."Document No." := "No.";
                    AutoRentLine."Line No." := 10000;
                    AutoRentLine."Type" := AutoRentLine."Type"::Resource;
                    AutoRentLine."Item/Resource No." := Auto."Rent Service";
                    AutoRentLine.Description := DescriptionLbl;
                    AutoRentLine.Ammount := 1;
                    Auto.CalcFields("Rent Price");
                    AutoRentLine.Price := Auto."Rent Price";
                    AutoRentLine."Sum" := AutoRentLine.Price;
                    AutoRentLine.Insert;
                end;
            end;
        }
        field(13; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Auto Rent Line"."Sum" where("Document No." = field("No.")));
            Editable = false;

        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
            trigger OnValidate()
            begin
                ProhibitInsertIfReleased();
            end;
        }
        field(31; "Reservation Date From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Date From';
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                ErrorText: Label 'You cant enter this date, because there is no reservation on this date for this customer and this car';
                IsItError: Boolean;
            begin
                AutoReservation.SetRange("Auto No.", Rec."Auto No.");
                IsItError := true;
                if AutoReservation.FindSet() then
                    repeat
                        if (AutoReservation.Client = Rec."Client No.") then begin
                            if "Reservation Date Until" = 0D then begin
                                if AutoReservation."Date From" = Rec."Reservation Date From" then begin
                                    IsItError := false;
                                    break;
                                end;
                            end
                            else begin
                                if ((AutoReservation."Date From" = Rec."Reservation Date From") AND (AutoReservation."Date Until" = Rec."Reservation Date Until")) then begin
                                    IsItError := false;
                                    break;
                                end;
                            end;
                        end;
                    until AutoReservation.Next() = 0;

                if (IsItError = true) then begin
                    Error(ErrorText);
                end;
                ProhibitInsertIfReleased();
            end;
        }
        field(32; "Reservation Date Until"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Date Until';
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                ErrorText: Label 'You cant enter this date, because there is no reservation on this date for this customer and this car';
                IsItError: Boolean;
            begin
                AutoReservation.SetRange("Auto No.", Rec."Auto No.");
                IsItError := true;
                if AutoReservation.FindSet() then
                    repeat
                        if (AutoReservation.Client = Rec."Client No.") then begin
                            if "Reservation Date From" = 0D then begin
                                if AutoReservation."Date Until" = Rec."Reservation Date Until" then begin
                                    IsItError := false;
                                    break;
                                end;
                            end
                            else begin
                                if ((AutoReservation."Date From" = Rec."Reservation Date From") AND (AutoReservation."Date Until" = Rec."Reservation Date Until")) then begin
                                    IsItError := false;
                                    break;
                                end;
                            end;
                        end;
                    until AutoReservation.Next() = 0;

                if (IsItError = true) then begin
                    Error(ErrorText);
                end;
                ProhibitInsertIfReleased();
            end;
        }
        field(40; Status; Enum "Auto Rent Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            "No." := GetNewContactNoFromNoSeries();
        end;
    end;

    procedure GetNewContactNoFromNoSeries(): Code[20]
    var
        ClientContractSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        ClientContractSetup.Get();
        ClientContractSetup.TestField("Rent Nos");
        exit(NoSeriesManagement.GetNextNo(ClientContractSetup."Rent Nos", WorkDate(), true))
    end;

    procedure ClearImage()
    begin
        Clear("Driver License");
        Modify();
    end;

    procedure ProhibitInsertIfReleased()
    var
        MessageLbl: Label 'You cant enter any new data when status is released. Field value havent been changed.';
    begin
        if (Rec.Status = Rec.Status::Released) then begin
            Rec := xRec;
            Message(MessageLbl);
        end;
    end;
}