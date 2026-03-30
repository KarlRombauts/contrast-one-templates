function getNIPSString : String
begin
result := '';
  if ((cbPregnancyOutcome.itemindex = 1) and ( cxccbReferralIndicators.States[2] = 1)) then
     result := result + #13#10 + 'The patient has been given a request for percept#|#+SUPSTM#/# testing and the result is expected in 3-5 days.'
end;

function getNIPSConclusion : String                                                       
begin
 result := '';
  if ((cbPregnancyOutcome.itemindex = 1) and ( cxccbReferralIndicators.States[2] = 1)) then
     result := result + 'The measurements are consistent with the expected gestation.  The patient has been given a request for percept#|#+SUPSTM#/# testing and the result is expected in 3-5 days.'

end;
