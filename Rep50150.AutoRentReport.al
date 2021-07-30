report 50150 "Auto Rent Report"
{
    Caption = 'Auto Rent Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Source/reportlayouts/R50150.rdl';

    dataset
    {
        dataitem("Auto Rent Header"; "Auto Rent Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {

            }
            column(Auto_No_; "Auto No.")
            {

            }
            column(Mark; Auto.Mark)
            {

            }
            column(Model; Auto.Model)
            {

            }
            column(Reservation_Date_From; "Reservation Date From")
            {

            }
            column(Reservation_Date_Until; "Reservation Date Until")
            {

            }
            column(ClientName; Client.Name)
            {

            }
            dataitem("Auto Rent Line"; "Auto Rent Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {

                }
                column(Ammount; Ammount)
                {

                }
                column(Price; Price)
                {

                }
                column("Sum"; "Sum")
                {

                }
            }
            column(RentPrice; RentPrice)
            {

            }
            column(TotalServicePrice; TotalServicePrice)
            {

            }
            column(TotalPrice; TotalPrice)
            {

            }

            trigger OnAfterGetRecord()
            var
                AutoRentLine: Record "Auto Rent Line";
            begin
                if not Auto.Get("Auto No.") then
                    Auto.Init();

                TotalServicePrice := 0;
                RentPrice := 0;
                TotalPrice := 0;
                Client.Reset();
                Client.SetRange("No.", "Client No.");
                Client.FindFirst();
                AutoRentLine.SetRange("Document No.", "No.");
                if AutoRentLine.FindSet() then
                    repeat
                        if AutoRentLine."Line No." = 10000 then begin
                            RentPrice := AutoRentLine."Sum";
                        end
                        else begin
                            TotalServicePrice += AutoRentLine."Sum";
                        end;

                    until AutoRentLine.Next = 0;
                TotalPrice := RentPrice + TotalServicePrice;
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

                }
            }
        }
    }
    var
        RentPrice: Decimal;
        Client: Record Customer;
        TotalServicePrice: Decimal;
        TotalPrice: Decimal;
        Auto: Record Auto;
}