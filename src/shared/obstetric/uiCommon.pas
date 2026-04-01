#ifndef __SHARED_OBSTETRIC_UICOMMON
#define __SHARED_OBSTETRIC_UICOMMON

procedure btnClear1OnClick(sender)
begin
  SetAnatomyChecks(cxgbTheChecks1, False);
end;

procedure btnSelectAll1OnClick(sender)
begin
  SetAnatomyChecks(cxgbTheChecks1, True);
end;

procedure cxccbReferralIndicationChange(Sender);
begin
  edtReferralIndicator1.Enabled := (cxccbReferralIndication.States[cxccbReferralIndication.Properties.Items.Count-1] = 1);
end;

#endif
