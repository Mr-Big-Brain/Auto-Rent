table 50156 "Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Lines';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
            trigger OnValidate()
            begin
                ProhibitInsertIfReleased();
            end;
        }
        field(10; "Item/Resource No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item/Resource No.';
            TableRelation =
            if ("Type" = const(Item)) Item else
            if ("Type" = const(Resource)) Resource;
            trigger OnValidate()
            var
                myInt: Integer;
                AutoRentLineStatus: Enum "Auto Rent Line Status";
                Item: Record Item;
                Resource: Record Resource;
            begin
                if ("Type" = AutoRentLineStatus::Item) then begin
                    Item.SetRange("No.", Rec."Item/Resource No.");
                    Item.FindFirst();
                    Description := Item.Description;
                    Price := Item."Unit Price"
                end;

                if ("Type" = AutoRentLineStatus::Resource) then begin
                    Resource.SetRange("No.", Rec."Item/Resource No.");
                    Resource.FindFirst();
                    Description := Resource.Name; //There was no description for Resource, so I decided to use Name instead of it
                    Price := Resource."Unit Price";
                end;
                ProhibitInsertIfReleased();
            end;
        }
        field(11; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            trigger OnValidate()
            begin
                ProhibitInsertIfReleased();
            end;
        }
        field(12; Ammount; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Ammount';
            trigger OnValidate()
            begin
                ProhibitInsertIfReleasedforammount();
                "Sum" := Ammount * Price;
            end;
        }
        field(13; Price; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Price';
            Editable = false;
        }
        field(14; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
            Editable = false;
        }

        field(40; "Type"; Enum "Auto Rent Line Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
            trigger OnValidate()
            begin
                ProhibitInsertIfReleased();
                if "Type" <> xRec."Type" then begin
                    "Sum" := 0;
                    Price := 0;
                    Ammount := 0;
                    Description := '';
                    "Item/Resource No." := '';
                end;
            end;
        }
    }


    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        MessageLbl: Label 'You cant delete this line';
        a: Page 46;
    begin
        if xRec."Line No." = 10000 then begin
            Rec := xRec;
        end;
    end;

    procedure ProhibitInsertIfReleased()
    var
        AutoRentHeader: Record "Auto Rent Header";
        MessageLbl1: Label 'You cant enter any new data when status is released.';
        MessageLbl2: Label 'You can modify only ammount in this line';
    begin
        AutoRentHeader.Get("Document No.");
        if (AutoRentHeader.Status = AutoRentHeader.Status::Released) then begin
            Rec := xRec;
            Message(MessageLbl1);
        end;
        if (Rec."Line No." = 10000) then begin
            Rec := xRec;
            Message(MessageLbl2);
        end;
    end;

    procedure ProhibitInsertIfReleasedforammount()
    var
        AutoRentHeader: Record "Auto Rent Header";
        MessageLbl1: Label 'You cant enter any new data when status is released. Field value havent been changed.';
        MessageLbl2: Label 'You cant modify default car rent price line';
    begin
        AutoRentHeader.Get("Document No.");
        if (AutoRentHeader.Status = AutoRentHeader.Status::Released) then begin
            Rec := xRec;
            Message(MessageLbl1);
        end;

    end;
}
