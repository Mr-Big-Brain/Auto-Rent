table 50152 "Auto"
{
    DataClassification = CustomerContent;
    Caption = 'Auto';
    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(10; Name; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(11; Mark; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Mark';
            TableRelation = "Auto Mark";
        }
        field(12; Model; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Model';
            TableRelation = "Auto Model"."Model Code" where("Mark Code" = field(Mark));
        }
        field(13; "Location Code"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Location Code';
            TableRelation = Location;
        }
        field(14; "Rent Service"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Rent Service';
            TableRelation = Resource;
            trigger OnValidate()
            begin
                CalcFields(Rec."Rent Price");
            end;
        }
        field(15; "Rent Price"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Rent Price';
            Editable = false;
            CalcFormula = lookup(Resource."Unit Cost" where("No." = field("Rent Service")));
        }
        field(30; "Production Year"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Production Year';
        }
        field(31; "Insurance Validity"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Insurance Validity';
        }
        field(32; "Technical Inspection Validity"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Technical Inspection Validity';
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
        if "No." = '' then
            "No." := GetNewContactNoFromNoSeries();
    end;

    procedure GetNewContactNoFromNoSeries(): Code[20]
    var
        ClientContractSetup: Record "Auto Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        ClientContractSetup.Get();
        ClientContractSetup.TestField("Auto Nos");
        exit(NoSeriesManagement.GetNextNo(ClientContractSetup."Auto Nos", WorkDate(), true))
    end;
}