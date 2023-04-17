           







           EVALUATE menu-input
              WHEN "0"
            CALL init-proc
              WHEN "1" THRU "9"
            CALL process-proc
               WHEN "R"
           CALL read-parms
             WHEN "X"
            CALL cleanup-proc
            WHEN OTHER
             CALL error-proc
              END-EVALUATE;