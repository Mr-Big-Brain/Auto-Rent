page 50159 "Auto Setup Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Auto Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Auto Nos"; Rec."Auto Nos")
                {
                    ApplicationArea = All;
                }
                field("Rent Nos"; Rec."Rent Nos")
                {
                    ApplicationArea = All;
                }
                field("Additions Location"; Rec."Additions Location")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExist();
    end;
}