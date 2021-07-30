page 50163 "Finished Auto Rent Header List"
{
    Caption = 'Finished Auto Rent Header List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Finished Auto Rent Header";
    CardPageId = "Finished Auto Rent Header Card";

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
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Driver License"; Rec."Driver License")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }
                field("Reservation Date From"; Rec."Reservation Date From")
                {
                    ApplicationArea = All;
                }
                field("Reservation Date Until"; Rec."Reservation Date Until")
                {
                    ApplicationArea = All;
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}