page 50162 "Finished AutoRent Line Subpage"
{
    Caption = 'Finished Auto Rent Line Subpage';
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Finished Auto Rent Line";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                }
                field("Item/Resource No."; Rec."Item/Resource No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Ammount; Rec.Ammount)
                {
                    ApplicationArea = All;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field("Sum"; Rec."Sum")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}