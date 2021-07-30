page 50152 "Auto List"
{
    Caption = 'Auto List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto";
    CardPageId = "Auto Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Mark; Rec.Mark)
                {
                    ApplicationArea = All;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = All;
                }
                field("Production Year"; Rec."Production Year")
                {
                    ApplicationArea = All;
                }
                field("Insurance Validity"; Rec."Insurance Validity")
                {
                    ApplicationArea = All;
                }
                field("Technical Inspection Validity"; Rec."Technical Inspection Validity")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Rent Service"; Rec."Rent Service")
                {
                    ApplicationArea = All;
                }
                field("Rent Price"; Rec."Rent Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ReservationList)
            {
                Caption = 'Go to Reservation List';
                ApplicationArea = all;
                Image = NewOrder;

                RunObject = Page "Auto Reservation List";
            }
            action(RunCarReport)
            {
                Caption = 'Run Car Report';
                ApplicationArea = all;
                Image = Accounts;

                RunObject = report "Auto Rent History Report";

            }
        }
    }
}