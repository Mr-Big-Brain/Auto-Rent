page 50155 "Auto Rent Header List"
{
    Caption = 'Auto Rent Header List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    CardPageId = "Auto Rent Header Card";

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
                field(Ammount; Rec."Total Amount")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
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
            action(RemoveLicense)
            {
                Caption = 'Remove Driver License Photo';
                ApplicationArea = All;
                Image = ImportLog;
                trigger OnAction()
                begin
                    Rec.ClearImage();
                end;
            }
            action(ReleaseDocument)
            {
                Caption = 'Release this document';
                ApplicationArea = All;
                Image = Allocate;
                trigger OnAction()
                var
                    AutoRentHeader: Record "Auto Rent Header";
                begin
                    Rec.Status := AutoRentHeader.Status::Released;
                    Rec.Modify(true);
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