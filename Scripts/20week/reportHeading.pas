#ifndef __SHARED_VARIANTS_GETREPORTHEADING_20WEEK
#define __SHARED_VARIANTS_GETREPORTHEADING_20WEEK

 function getReportHeading : String
 begin
   result := '';                                         
   if (cxccbReferralIndication.states[2] = 1) then
   begin
     if (cxccbReferralIndication.states[0] = 1) then
        result := 'Second Trimester Ultrasound and Aminiocentesis'
     else if (cxccbReferralIndication.states[1] = 1) then
         result := 'Early Second Trimester Ultrasound and Aminiocentesis'
   end
   if (cxccbReferralIndication.states[3] = 1) then
       result := 'Second Trimester Ultrasound Report'
 end;

#endif
