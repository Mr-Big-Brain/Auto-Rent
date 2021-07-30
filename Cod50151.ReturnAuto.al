codeunit 50151 "Return Auto"
{
    procedure ReturnAuto("Header No.": Code[20])
    var
        AutoRentHeader: Record "Auto Rent Header";
        AutoRentLine: Record "Auto Rent Line";
        FinishedAutoRentHeader: Record "Finished Auto Rent Header";
        FinishedAutoRentLine: Record "Finished Auto Rent Line";
        FinishedAutoRentLinePaste: Record "Finished Auto Rent Line";

    begin
        AutoRentHeader.SetRange("No.", "Header No.");
        AutoRentHeader.FindFirst();
        AutoRentLine.SetRange("Document No.", "Header No.");
        AutoRentHeader.CalcFields("Total Amount");
        FinishedAutoRentHeader.TransferFields(AutoRentHeader);
        FinishedAutoRentHeader."Total Amount" := AutoRentHeader."Total Amount";
        FinishedAutoRentHeader.Insert();

        if AutoRentLine.FindSet() then
            repeat
                FinishedAutoRentLinePaste.TransferFields(AutoRentLine);
                FinishedAutoRentLinePaste.Insert();
                AutoRentLine.Delete();
            until AutoRentLine.Next() = 0;
        AutoRentHeader.Delete();
    end;

    procedure TransferDamageInfo("Damage No.": Code[20])
    var
        AutoRentDamage: Record "Auto Rent Damage";
        AutoRentDamagePaste: Record "Auto Rent Damage";
        AutoDamage: Record "Auto Damage";
        AutoRentHeader: Record "Auto Rent Header";
        AutoDamageLineHelper: Record "Auto Damage";
    begin
        AutoRentDamage.SetRange("Document No.", "Damage No.");
        AutoRentHeader.SetRange("No.", "Damage No.");
        AutoRentHeader.FindFirst();

        if AutoRentDamage.FindSet() then
            repeat
                AutoRentDamagePaste.TransferFields(AutoRentDamage);
                AutoDamageLineHelper.SetRange("Auto No.", AutoRentHeader."Auto No.");
                if AutoDamageLineHelper.FindLast() then begin
                    AutoDamage."Line No." := AutoDamageLineHelper."Line No." + 10000;
                end
                else begin
                    AutoDamage."Line No." := 10000;
                end;

                AutoDamage."Auto No." := AutoRentHeader."Auto No.";
                AutoDamage."Date" := AutoRentDamagePaste."Date";
                AutoDamage.Description := AutoRentDamagePaste.Description;
                AutoDamage.Insert();
                AutoRentDamage.Delete;
            until AutoRentDamage.Next() = 0;
    end;
}