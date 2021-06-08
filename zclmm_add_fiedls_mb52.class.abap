CLASS zclmm_add_fiedls_mb52 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA:
      gv_ok TYPE abap_bool .

    METHODS constructor
      IMPORTING
        !iv_uname TYPE sy-uname .

    METHODS change
      CHANGING
        !ct_fieldcat TYPE slis_t_fieldcat_alv
        !ct_bestand  TYPE ANY TABLE .

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zclmm_add_fiedls_mb52 IMPLEMENTATION.

  METHOD constructor .

    DATA:
      lv_modul TYPE zca_constants_t-modul VALUE 'MM',
      lv_proce TYPE zca_constants_t-proce VALUE 'MB52',
      lv_fname TYPE zca_constants_t-fname VALUE 'UNAME',
      lr_const TYPE RANGE OF zca_constants_t-low.

    gv_ok = abap_off .

    zclca_fixedvals=>get_cons_ran( EXPORTING  iv_bukrs = space
                                              iv_modul = lv_modul
                                              iv_proce = lv_proce
                                              iv_fname = lv_fname
                                   IMPORTING  et_range = lr_const
                                   EXCEPTIONS no_data  = 1 ) .
    IF ( sy-subrc EQ 0 ) AND
       ( iv_uname IN lr_const ) .
      me->gv_ok = abap_on .
    ENDIF.

  ENDMETHOD .


  METHOD change .

    IF ( me->gv_ok EQ abap_on ) .

      APPEND VALUE #( fieldname = 'ATWRT'
                      tabname   = 'BESTAND'
                      seltext_m = 'New-Field' ) TO ct_fieldcat .

      LOOP AT ct_bestand ASSIGNING FIELD-SYMBOL(<fs_output>).

        ASSIGN COMPONENT 'ATWRT' OF STRUCTURE <fs_output> TO FIELD-SYMBOL(<fs_field>) .
        IF ( <fs_field> IS ASSIGNED ) .
          <fs_field> = 'Joao-Palma' .
          UNASSIGN  <fs_field> .
        ENDIF .

      ENDLOOP.

    ENDIF .
*
*data: wa_fcat like line of fieldcat,
*      g_tabix like sy-tabix.
*
*wa_fcat-fieldname = ‘LGPBE’.
*wa_fcat-tabname   = ‘BESTAND’.
*wa_fcat-seltext_m = ‘Storage Bin’.
*append wa_fcat to fieldcat.
*clear wa_fcat.
*
*wa_fcat-fieldname = ‘BISMT’.
*wa_fcat-tabname   = ‘BESTAND’.
*wa_fcat-seltext_m = ‘Old Material Number’.
*append wa_fcat to fieldcat.
*clear wa_fcat.
*
*select matnr,
*werks,
*lgort,
*lgpbe
*from mard
*into table @data(lt_mard)
*      for all ENTRIES in @bestand
*      where matnr = @bestand-matnr
*      and  werks = @bestand-werks
*      and  lgort = @bestand-lgort.
*
*select matnr,
*bismt
*from mara
*into table @data(lt_mara)
*      for all ENTRIES in @bestand
*      where matnr = @bestand-matnr.
*
*loop at bestand[] assigning field-symbol(<lfs_output>).
*  read table lt_mard into data(ls_mard) with key matnr = <lfs_output>-matnr
*        werks = <lfs_output>-werks
*        lgort = <lfs_output>-lgort.
*  if sy-subrc = 0.
*    <lfs_output>-lgpbe = ls_mard-lgpbe.
*  endif.
*  read table lt_mara into data(ls_mara) with key matnr = <lfs_output>-matnr.
*  if sy-subrc = 0.
*    <lfs_output>-bismt = ls_mara-bismt.
*  endif.
*endloop.
  ENDMETHOD .

ENDCLASS.
