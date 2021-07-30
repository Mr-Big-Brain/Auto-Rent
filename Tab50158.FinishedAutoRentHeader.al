table 50158 "Finished Auto Rent Header"
{
    DataClassification = CustomerContent;
    Caption = 'Finished Auto Rent Header';
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
            Editable = false;
        }
        field(11; "Driver License"; Blob)
        {
            DataClassification = CustomerContent;
            Caption = 'Driver License';
        }
        field(12; "Auto No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            Editable = false;
        }
        field(13; "Total Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Total Amount';
            Editable = false;
        }
        field(30; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
            Editable = false;
        }
        field(31; "Reservation Date From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Date From';
            Editable = false;
        }
        field(32; "Reservation Date Until"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation Date Until';
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
}