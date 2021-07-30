page 50158 "Auto Rent Header Card"
{
    Caption = 'Auto Rent Header Card';
    PageType = Card;
    SourceTable = "Auto Rent Header";

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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

            }
            part(AutoRentLineSubpage; "Auto Rent Line Subpage")
            {
                Caption = 'Auto Rent Line';
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Remove)
            {
                Caption = 'Remove Driver License Photo';
                ApplicationArea = All;
                Image = ImportLog;
                trigger OnAction()
                begin
                    Rec.ClearImage();
                end;
            }
            action(ReturnAuto)
            {
                Caption = 'Return Auto';
                ApplicationArea = All;
                Image = History;
                trigger OnAction()
                var
                    ReturnAuto: Codeunit "Return Auto";
                begin
                    ReturnAuto.TransferDamageInfo(Rec."No.");
                    ReturnAuto.ReturnAuto(Rec."No.");
                end;
            }
        }
    }
}