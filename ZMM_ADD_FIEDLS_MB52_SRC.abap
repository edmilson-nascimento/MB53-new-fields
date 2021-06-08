  TRY.

      NEW zclmm_add_fiedls_mb52( sy-uname )->change( CHANGING !ct_fieldcat = fieldcat
                                                              !ct_bestand = bestand[] ) .
    CATCH zcx_bc_exceptions INTO DATA(lo_excptin).
      MESSAGE ID   lo_excptin->msgid
            TYPE   lo_excptin->msgty
            NUMBER lo_excptin->msgno
            WITH   lo_excptin->msgv1
                   lo_excptin->msgv2
                   lo_excptin->msgv3
                   lo_excptin->msgv4.
  ENDTRY.
