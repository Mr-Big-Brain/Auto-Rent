page 50164 "Finished Auto Rent Header Card"
{
    Caption = 'Finished Auto Rent Header Card';
    PageType = Card;
    SourceTable = "Finished Auto Rent Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
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
                field(Ammount; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }

            }
            part(FinishedAutoRentLineSubpage; "Finished AutoRent Line Subpage")
            {
                Caption = 'Finished Auto Rent Line';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }
}