table 50159 "Finished Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Damage';
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
            Editable = false;
        }
        field(10; "Item/Resource No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item/Resource No.';
            Editable = false;
        }
        field(11; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Editable = false;
        }
        field(12; Ammount; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Ammount';
            Editable = false;
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
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}