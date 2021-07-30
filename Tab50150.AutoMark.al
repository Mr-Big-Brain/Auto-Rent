table 50150 "Auto Mark"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Mark';
    fields
    {
        field(1; "Mark Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mark Code';
        }
        field(10; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Mark Code")
        {
            Clustered = true;
        }
    }
}