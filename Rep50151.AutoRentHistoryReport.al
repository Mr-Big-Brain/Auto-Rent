report 50151 "Auto Rent History Report"
{
    Caption = 'Auto Rent History Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Source/reportlayouts/R50151.rdl';

    dataset
    {
        dataitem("Finished Auto Rent Header"; "Finished Auto Rent Header")
        {
            RequestFilterFields = "Auto No.";
            column(Auto_No_; "Auto No.")
            {

            }
            dataitem(Auto; Auto)
            {
                DataItemLink = "No." = field("Auto No.");
                column(Mark; Mark)
                {

                }
                column(Model; Model)
                {

                }
            }
            column(Reservation_Date_From; "Reservation Date From")
            {

            }
            column(Reservation_Date_Until; "Reservation Date Until")
            {

            }
            column(CustomerName; Customer.Name)
            {

            }
            column(Total_Amount; "Total Amount")
            {

            }
            column(Total; Total)
            {

            }
            column(UserDateFrom; UserDateFrom)
            {

            }
            column(UserDateUntil; UserDateUntil)
            {

            }


            trigger OnAfterGetRecord()
            var
                FinishedAutoRentHeader: Record "Finished Auto Rent Header";
            begin
                Customer.Reset();
                Customer.SetRange("No.", "Client No.");
                Customer.FindFirst();
                Total := 0;
                FinishedAutoRentHeader.SetRange("Auto No.", "Auto No.");
                if FinishedAutoRentHeader.FindSet() then
                    repeat
                        if ((FinishedAutoRentHeader."Reservation Date From" >= UserDateFrom) AND
                        (FinishedAutoRentHeader."Reservation Date Until" <= UserDateUntil)) then begin
                            Total += FinishedAutoRentHeader."Total Amount";
                        end;
                    until FinishedAutoRentHeader.Next = 0;
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(UserDateFrom; UserDateFrom)
                    {
                        Caption = 'From';
                        ApplicationArea = All;
                    }
                    field(UserDateUntil; UserDateUntil)
                    {
                        Caption = 'Until';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var
        Total: Decimal;
        UserDateFrom: Date;
        UserDateUntil: Date;
        Customer: Record Customer;
}