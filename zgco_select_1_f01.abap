* select all fields from zdriver_car_kde

SELECT * FROM zdriver_car_kde

* define select options and parameters

WHERE zdriver_car_kde~id_driver IN @s_id
AND zdriver_car_kde~car_color = @p_carClr

ORDER BY zdriver_car_kde~DATE_BIRTH ASCENDING
INTO TABLE @DATA(lt_zdriver).


IF sy-subrc <> 0.
  MESSAGE e013(zgco_msg).
  LEAVE LIST-PROCESSING.
ELSE.
  MESSAGE s014(zgco_msg).
ENDIF.

* Create objcet alv for factory and display method
DATA : lo_alv TYPE REF TO cl_salv_table.

* Call factory method with class/interface cl_salv_table
CALL METHOD cl_salv_table=>factory
    IMPORTING
      r_salv_table   = lo_alv
  CHANGING
    t_table = lt_zdriver.

* call display method with class/interface cl_salv_table
CALL METHOD lo_alv->display.

* test for git