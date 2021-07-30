table 50151 "Auto Model"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Model';
    fields
    {
        field(1; "Mark Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mark Code';
            TableRelation = "Auto Mark";
        }
        field(2; "Model Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Model Code';
        }
        field(10; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Mark Code", "Model Code")
        {
            Clustered = true;
        }
    }
}