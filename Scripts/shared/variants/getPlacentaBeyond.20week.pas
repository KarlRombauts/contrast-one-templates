#ifndef __SHARED_VARIANTS_GETPLACENTABEYOND_20WEEK
#define __SHARED_VARIANTS_GETPLACENTABEYOND_20WEEK

 function getPlacentaBeyond(infetus : integer) : string
 begin
   result := '' ;
   result := result + 'Placenta is ' + GetPlacenta +', extending ' + GetPlacenta1InvertPosition + ' ' + GetPlacenta1Measure +' mm beyond the internal cervical os.';
 end;

#endif
