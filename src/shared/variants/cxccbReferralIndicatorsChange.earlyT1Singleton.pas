#ifndef __SHARED_VARIANTS_CXCCBREFERRALINDICATORSCHANGE_EARLYT1SINGLETON
#define __SHARED_VARIANTS_CXCCBREFERRALINDICATORSCHANGE_EARLYT1SINGLETON

procedure cxccbReferralIndicatorsChange(Sender);
begin
  edtPresentComplaintOther.Enabled := (cxccbReferralIndicators.States[cxccbReferralIndicators.Properties.Items.Count-1] = 1);
end;

#endif
