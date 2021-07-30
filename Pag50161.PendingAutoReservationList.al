page 50161 "Pending Auto Reservation List"
{
    Caption = 'Pending Auto Reservations List';
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
    trigger OnOpenPage()
    var
        TodayDate: Date;
        DateForRange: Date;
    begin
        TodayDate := Today;
        DateForRange := CalcDate('<CY+10Y>', TodayDate);
        Rec.SetRange("Date Until", Today, DateForRange);
    end;

    var
        AutoReservation: Record "Auto Reservation";
}
