table 50157 "Auto Rent Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Damage';
    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "Auto Rent Header";
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(10; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
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