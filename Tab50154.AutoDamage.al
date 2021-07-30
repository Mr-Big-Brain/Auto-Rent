table 50154 "Auto Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Damage';
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
        field(11; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Client';
        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }
        field(40; "Status"; Enum "Auto Damage Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Auto No.", "Line No.")
        {
            Clustered = true;
        }
    }
}