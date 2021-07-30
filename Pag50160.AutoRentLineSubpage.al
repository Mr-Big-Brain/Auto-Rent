page 50160 "Auto Rent Line Subpage"
{
    Caption = 'Auto Rent Line Subpage';
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";
    AutoSplitKey = true;
    DelayedInsert = true;
    MultipleNewLines = true;

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

    trigger OnDeleteRecord(): Boolean
    var
        MessageLbl: Label 'You cant delete this line';
    begin
        if xRec."Line No." = 10000 then begin
            Message(MessageLbl);
            exit(false);
        end
        else begin
            Commit();
        end;
    end;
}