page 50151 "Auto Model List"
{
    Caption = 'Auto Model List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Model";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Mark Code"; Rec."Mark Code")
                {
                    ApplicationArea = All;
                }
                field("Model Code"; Rec."Model Code")
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