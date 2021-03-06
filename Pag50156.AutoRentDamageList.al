page 50156 "Auto Rent Damage List"
{
    Caption = 'Auto Rent Damage List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Damage";
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
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}