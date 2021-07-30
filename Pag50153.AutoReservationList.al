page 50153 "Auto Reservation List"
{
    Caption = 'Auto Reservation List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";
    AutoSplitKey = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field(Client; Rec.Client)
                {
                    ApplicationArea = All;
                }
                field("Date From"; Rec."Date From")
                {
                    ApplicationArea = All;
                }
                field("Date Until"; Rec."Date Until")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}