* create select options and parameters, here our selection is just id of the driver.
* so you can use both parameters or select options for the sama purpose

* create first general block

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

* create parameters, here you can choose directly data type, you can use obligotory or not

  PARAMETERS: p_carClr TYPE zdriver_car_kde-car_color OBLIGATORY DEFAULT 'ROUGE' .

* create select options, here I choosed tablename and field name
* Here the important thing is that you have to declare table name which is used in the select options or parameters
* You can declare it at the beginning of the TOP file

  SELECT-OPTIONS s_id FOR zdriver_car_kde-ID_DRIVER.

SELECTION-SCREEN END OF BLOCK b1.