codeunit 59900 "ToolBox Permissions"
{
    Permissions = TableData "Posted Bank Rec. Header" = RIMD,
                  TableData "Posted Bank Rec. Line" = RIMD,
                  TableData "Posted Deposit Header" = RIMD,
                  TableData "Posted Deposit Line" = RIMD;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Remote Package Management Hgd", 'OnBeforeInsertingPackageRecord', '', true, true)]
    local procedure OnBeforeInsertingPackageRecord(var Handled: Boolean; var Ref: RecordRef; var TableInfo: Record "Remote Package Table Hgd"; var TotalPull: Integer)
    begin
        if Ref.Number() in [Database::"Posted Bank Rec. Header", Database::"Posted Bank Rec. Line", Database::"Posted Deposit Header", Database::"Posted Deposit Line"] then begin
            Ref.Insert(TableInfo.TableValidation);
            Handled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Remote Package Management Hgd", 'OnBeforeModifyingPackageRecord', '', true, true)]
    local procedure OnBeforeModifyingPackageRecord(var Handled: Boolean; var Ref: RecordRef; var TableInfo: Record "Remote Package Table Hgd"; var TotalPull: Integer)
    begin
        if Ref.Number() in [Database::"Posted Bank Rec. Header", Database::"Posted Bank Rec. Line", Database::"Posted Deposit Header", Database::"Posted Deposit Line"] then begin
            Ref.Modify(TableInfo.TableValidation);
            Handled := true;
        end;
    end;
}