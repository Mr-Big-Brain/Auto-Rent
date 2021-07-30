table 50160 "Auto Setup"
{
    Caption = 'Auto Setup';
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary key';
        }
        field(10; "Auto Nos"; Code[20])
        {
            Caption = 'Auto Nos';
            TableRelation = "No. Series";
        }
        field(11; "Rent Nos"; Code[20])
        {
            Caption = 'Rent Nos';
            TableRelation = "No. Series";
        }
        field(12; "Additions Location"; Code[20])
        {
            Caption = 'Additions Location';
            TableRelation = Location;
        }
    }
    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        SetDefaultValues();
    end;

    procedure InsertIfNotExist()
    begin
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;

    procedure SetDefaultValues()
    var
        ClientContractManagement: Codeunit "Auto Management";
        ContractNosCodeLbl: Label 'CLIENT CONTR';
        ContractNosDescriptionLbl: Label 'Client Contract Nos';
        ContractNosFirstNoLbl: Label 'CC0001';
    begin
        if "Auto Nos" = '' then
            "Auto Nos" := ClientContractManagement.NewNoSeries(ContractNosCodeLbl, ContractNosDescriptionLbl, ContractNosFirstNoLbl);

        if "Rent Nos" = '' then
            "Rent Nos" := ClientContractManagement.NewNoSeries(ContractNosCodeLbl, ContractNosDescriptionLbl, ContractNosFirstNoLbl);
    end;
}