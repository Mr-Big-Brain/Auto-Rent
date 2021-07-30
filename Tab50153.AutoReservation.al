table 50153 "Auto Reservation"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Reservation';
    fields
    {
        field(1; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(11; Client; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Client';
            TableRelation = Customer;
        }
        field(30; "Date From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date From';
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                ErrorText: Label 'You cant enter this date, because someone already ordered car from this range';
            begin
                AutoReservation.SetRange("Auto No.", Rec."Auto No.");
                if AutoReservation.FindSet() then
                    repeat
                        if ((AutoReservation."Date From" <= Rec."Date From") AND (AutoReservation."Date Until" >= Rec."Date From") AND (AutoReservation."Line No." <> Rec."Line No.")) then begin
                            Error(ErrorText);
                        end;
                    until AutoReservation.Next() = 0;
                CheckDates();
                CheckInsuranceAndInspection("Date From");
            end;
        }
        field(31; "Date Until"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date Until';
            trigger OnValidate()
            var
                AutoReservation: Record "Auto Reservation";
                ErrorText: Label 'You cant enter this date, because someone already ordered car from this range';
            begin
                AutoReservation.SetRange("Auto No.", Rec."Auto No.");
                if AutoReservation.FindSet() then
                    repeat
                        if ((AutoReservation."Date From" <= Rec."Date Until") AND (AutoReservation."Date Until" >= Rec."Date Until") AND (AutoReservation."Line No." <> Rec."Line No.")) then begin
                            Error(ErrorText);
                        end;
                    until AutoReservation.Next() = 0;
                CheckDates();
                CheckInsuranceAndInspection(Rec."Date Until");
            end;
        }
    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }
    procedure CheckDates()
    var
        ErrorLbl: Label 'End date cant be earlier that begin date';
    begin
        if ((Rec."Date From" > Rec."Date Until") AND (Rec."Date From" <> 0D) AND (Rec."Date Until" <> 0D)) then begin
            Error(ErrorLbl);
        end;

    end;

    procedure CheckInsuranceAndInspection(EnteredDate: Date)
    var
        ErrorLbl1: Label 'You cant select this date. Car insurance will be expired on this date';
        ErrorLbl2: Label 'You cant select this date. Car technical inspection validity will be expired on this date';
        Auto: Record Auto;
    begin
        Auto.SetRange("No.", Rec."Auto No.");
        Auto.FindFirst();
        if (EnteredDate <> 0D) then begin
            if Auto."Insurance Validity" < EnteredDate then begin
                Error(ErrorLbl1);
            end;
            if Auto."Technical Inspection Validity" < EnteredDate then begin
                Error(ErrorLbl2);
            end;
        end;

    end;
}