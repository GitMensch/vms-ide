IDENTIFICATION DIVISION.
PROCEDURE DIVISION.
DECLARATIVES.
DET SECTION.
USE BEFORE REPORTING DETAIL-LINE.
DETA-1.
    ACCEPT ITEMF FROM DAY-OF-WEEK.
END DECLARATIVES.
begin.
    replace ==alpha== by ==NUM-1== ==num== by ==ALPHA-1==.
    copy custfile replacing xyz by 6, ==r== by ==4==
        "KEY" by =="abc".
        * cust-number is a new field
        03 cust-number pic 9(8)==.
    IF ITEMA < 10 OR > 20
        NEXT SENTENCE
    ELSE
        MOVE "X" TO ITEMB.

    ACCEPT DEST-EXAMPLE FROM LINE NUMBER ITEMB PLUS 0
        ON EXCEPTION 
            ADD 2 ITEMB TO ITEMA.
        NOT ON EXCEPTION 
            ADD 38 TO ITEMA ITEMB.
    ADD 14 TO ITEMA
        NOT ON SIZE ERROR
            ACCEPT ITEMF FROM DAY-OF-WEEK.
        ON SIZE ERROR
            ACCEPT ITEMF FROM DAY-OF-WEEK.
    ADD 7 ITEMB TO ITEMD (ITEMB)
        ON SIZE ERROR
            ACCEPT ITEMF FROM DAY-OF-WEEK
    END-ADD
    ADD 1 TO ITEMB.
    ALTER PROC-A TO PROC-EE PROC-E TO PROC-CC.
    CALL "NEWPROG" USING ITEMA
        BY DESCRIPTOR ITEMB ITEMC "TOTALS"
        BY REFERENCE ITEMD "PAYROLL"
        BY VALUE ITEME 995.99
        BY DESCRIPTOR ITEMD ITEMF
        BY CONTENT ITEMG "SUMMARY FLAG".
    CALL PROG-TO-CALL USING ITEMA.
    CALL "PROG010" USING ITEMA ITEMB "XYZ"
        GIVING ITEMC
        ON EXCEPTION 
            CANCEL SUB-PROG-A "PROG12" SUB-PROG-B.
    CLOSE EMPLOYEE-FILE.
    CLOSE EMPLOYEE-FILE REEL NO REWIND.
    CLOSE EMPLOYEE-FILE LOCK.
    COMPUTE ITEMC =
        (ITEMA + 6) ** (.1 * ITEMD).
    COMPUTE ITEMC ROUNDED =
        (ITEMA + 6) ** (.1 * ITEMD)
        ON SIZE ERROR
            CANCEL SUB-PROG-A.
        NOT ON SIZE ERROR
            delete file-1.
    DISPLAY ITEMC.
    DISPLAY ITEMD UPON ERR-REPORTER.
    DISPLAY ITEMD ITEMA "ARE" ITEMB.
    DISPLAY ITEMD SPACE ITEMA "AREs" ITEMB.
    DISPLAY ITEMC "sISs" NO ADVANCING.
    DISPLAY
        ITEMF WITH CONVERSION LINE PLUS
        ITEMG WITH CONVERSION LINE PLUS
        ITEMH WITH CONVERSION LINE PLUS
        ITEMI WITH CONVERSION LINE PLUS.
    DIVIDE ITEMA INTO ITEMB.
    DIVIDE ITEMA INTO ITEMB ROUNDED.
    DIVIDE ITEMA INTO ITEMB
        GIVING ITEMD.
    DIVIDE ITEMA INTO ITEMB
        GIVING ITEMD ROUNDED.
    DIVIDE ITEMA BY ITEMB
        GIVING ITEMD.
    DIVIDE ITEMA INTO ITEMB
        GIVING ITEMD REMAINDER ITEMC.
    DIVIDE ITEMA INTO ITEMB 
        GIVING ITEMD ROUNDED REMAINDER ITEMC.
    DIVIDE ITEMA INTO ITEMB
        GIVING ITEME REMAINDER ITEMC.
    DIVIDE ITEMA INTO ITEMB
        GIVING ITEME ROUNDED REMAINDER ITEMC.
    DIVIDE ITEME INTO ITEMF GIVING ITEMG ITEMD
        ON SIZE ERROR
            DISPLAY ITEMC.
    EVALUATE ITEMA
        WHEN A-01 ALPHABETIC ACCEPT ITEMA FROM DAY-OF-WEEK
        WHEN "A02" THRU "C16" ACCEPT ITEMB FROM DAY-OF-WEEK
        WHEN "C20" THRU "L86" ACCEPT ITEMC FROM DAY-OF-WEEK
        WHEN "R20" ADD 1 TO R-TOT
                   ACCEPT ITEMD FROM DAY-OF-WEEK
        WHEN OTHER ACCEPT ITEME FROM DAY-OF-WEEK
    END-EVALUATE.
    EVALUATE LOW-STOK   WEEK-USE        LOC-VNDR    ON-ORDER    TRUE
        WHEN "Y",       16 THRU 999,    ANY,        "N"         A > 10          GO TO RUSH-ORDER
        WHEN "Y",       16 THRU 999,    ANY,        "Y"         A > 20          GO TO NORMAL-ORDER
        WHEN "Y",       8 THRU 15,      "N",        "N"         A > 30          GO TO RUSH-ORDER
        WHEN "Y",       8 THRU 15,      "N",        "Y"         A < 10          GO TO NORMAL-ORDER
        WHEN "Y",       8 THRU 15,      "Y",        "N"         A < 20          GO TO NORMAL-ORDER
        WHEN "Y",       0 THRU 7,       ANY,        "N"         A = ZERO        GO TO NORMAL-ORDER
        WHEN "N",       ANY,            ANY,        "Y"         NOT A = ZERO    GO TO CANCEL-ORDER
    END-EVALUATE.
REPORT-INVALID-ADD.
    DISPLAY " ".
    DISPLAY "INVALID ADDITION".
    DISPLAY "RECORD ALREADY EXISTS".
    DISPLAY "UPDATE ATTEMPT: " UPDATE-REC.
    DISPLAY "EXISTING RECORD: " OLD-REC.
REPORT-INVALID-ADD-EXIT.
    EXIT.
cont-para.
    IF ITEMA < 20
        MOVE "X" TO ITEMB.
* comment
    IF ITEMA > 10
        MOVE "X" TO ITEMB
    ELSE
        GO TO PROC-A.

    IF ITEMA < 10 OR > 20
        NEXT SENTENCE
    ELSE
        MOVE "X" TO ITEMB.
* comment
    IF ITEMA > 10
        IF ITEMA = ITEMC
            MOVE "X" TO ITEMB
        ELSE
            MOVE "Y" TO ITEMB
    ELSE
        GO TO PROC-A.
    IF ITEMA > 10
        IF ITEMA = ITEMC
            ADD 1 TO ITEMD
            MOVE "X" TO ITEMB
        END-IF
        ADD 1 TO ITEMD.
    INITIALIZE ITEMA.
    INITIALIZE ITEMB ITEMG.
    INITIALIZE ITEMA REPLACING ALPHANUMERIC BY "ABCDE".
    INITIALIZE ITEMG REPLACING NUMERIC BY 9.
    INITIALIZE ITEMA REPLACING NUMERIC-EDITED BY 16.
    INITIALIZE ITEMA REPLACING ALPHANUMERIC-EDITED BY "ABCD".
    INITIALIZE ITEMA REPLACING ALPHANUMERIC BY "99".
    INITIALIZE ITEMB ITEMG 
        REPLACING 
            ALPHANUMERIC BY "ABCDE"
            NUMERIC BY 9.
    INSPECT ITEMA TALLYING COUNT1 FOR LEADING "L" BEFORE "A",
        COUNT2 FOR LEADING "A" BEFORE "L".
    INSPECT ITEMA TALLYING COUNT1 FOR ALL "L" "R"
        REPLACING LEADING "A" BY "E" AFTER INITIAL "L".
    INSPECT ITEMA REPLACING ALL "A" BY "G" BEFORE "X".
    INSPECT ITEMA TALLYING COUNT1 FOR CHARACTERS AFTER "J"
        REPLACING ALL "A" BY "B".
    INSPECT ITEMA REPLACING ALL "X" BY "Y", "B" BY "Z",
        "W" BY "Q" AFTER "R".
    INSPECT ITEMA REPLACING CHARACTERS BY "B" BEFORE "A".
    INSPECT ITEMA REPLACING ALL "A" BY "X" ALL "R" BY "X"
        AFTER "XXL".
    INSPECT ITEMA CONVERTING "SIR" TO "DTA"
        AFTER QUOTE BEFORE "@".
    if a < 100 then
        merge file-1 ascending key-1 key-2 descending key-3
            sequence alph-1
            using file-2 file-3 file-4
            output procedure is out-proc-1 thru end-proc-1
    else 
        exit
    end-if
    MULTIPLY 2 BY ITEMB.
    MULTIPLY 3 BY 1-A of 2-a in 3-b-group giving ITEMB
        ON SIZE ERROR
            MOVE 0 TO ITEMC.
    MULTIPLY 4 BY ITEMA ITEMB ITEMC
        ON SIZE ERROR
            MOVE 1 TO ITEMD
    END-MULTIPLY
    MULTIPLY 2 BY ITEMA ITEMB ITEMC
        ON SIZE ERROR
            ADD 1 TO ITEMD
    END-MULTIPLY.
    OPEN INPUT MASTER-FILE NO REWIND ALLOWING UPDATERS READERS
         I-O employee-file LOCK.
    OPEN INPUT FILE1-SEQ file2-seq file-3seq allowing no 
         extend ext-file-1.
    OPEN OUTPUT FILE1-RAN no-rewind.
    OPEN I-O FILE1-DYN.
    OPEN EXTEND FILE1-EXT.
    PERFORM PROC-A THRU PROC-B
        TEST BEFORE
        VARYING ITEMA
        FROM ITEMB BY ITEMC
        UNTIL CONDITION-A.
    PERFORM PROC-A THRU PROC-B
        TEST BEFORE
        VARYING ITEMA
            FROM ITEMB BY ITEMC
            UNTIL CONDITION-A
        AFTER ITEMD
            FROM ITEME BY ITEMF
            UNTIL CONDITION-B.
    PERFORM PROC-A THRU PROC-B
        TEST AFTER
        VARYING ITEMA
            FROM ITEMB BY ITEMC
            UNTIL CONDITION-A.
    PERFORM PROC-A THRU PROC-C 3 TIMES.
    PERFORM PROC-A THRU PROC-B
        VARYING ITEMC FROM 1 BY 1
        UNTIL ITEMC > 5.
    PERFORM PROC-A THRU PROC-B TEST AFTER VARYING ITEMC FROM 1 BY 1 UNTIL ITEMC > 5.
    PERFORM
        VARYING ITEMC FROM 1 BY 2
        UNTIL ITEMC > 7
            MOVE CHARA (ITEMC) TO CHARB (ITEMC)
            MOVE CHARA (ITEMC) TO CHARB (ITEMC + 3)
    END-PERFORM.
    READ MASTER-FILE KEY IS MASTER-KEY ALLOWING NO OTHERS.
    READ employee-file NEXT RECORD WITH LOCK
        AT END GO TO 999-EOJ..
    READ employee-file NEXT WITH LOCK.
    READ FILE-A INTO rec-a
        REGARDLESS OF LOCK
        AT END PERFORM NO-MORE-RECS
               DISPLAY "No more records." END-READ.
    IF ITEMA = ITEMB
        READ FILEA ALLOWING UPDATERS
            AT END MOVE ITEMC TO ITEMB
                   MOVE ITEMC-1 TO ITEMB-1
    ELSE
        MOVE ITEMD TO ITEME.
    READ FILE-A INVALID KEY CONTINUE.
    RECORD DEPENDENCY path-name TYPE IS relation-type IN DICTIONARY.
    RELEASE rec FROM src-area.
    RETURN smrg-file RECORD INTO dest-area 
        AT END CONTINUE
        NOT AT END 
            DISPLAY "No more records."
            exit
    END-RETURN
    REWRITE rec-name FROM src-item
        ALLOWING NO OTHERS
        INVALID KEY CONTINUE
        NOT INVALID KEY EXIT
    END-REWRITE
    SEARCH ALL STATES
        AT END
            MOVE 1 TO STATE-ERROR
            GO TO SEARCH-END
        WHEN STATE-USPS-CODE (STATE-INDEX) = CUSTOMER-USPS-STATE
            MOVE 0 TO STATE-ERROR
            MOVE STATE-REGION (STATE-INDEX) TO CUSTOMER-REGION.
* search
INITIALIZE-SEARCH.
    MOVE "2" TO CUSTOMER-REGION.
SEARCH-LOOP.
    SEARCH STATES
        AT END
            MOVE 1 TO STATE-ERROR
            GO TO SEARCH-END
        WHEN STATE-REGION (STATE-INDEX) = CUSTOMER-REGION
            MOVE 0 TO STATE-ERROR
            DISPLAY STATE-USPS-CODE (STATE-INDEX)
                " " STATE-INDEX WITH CONVERSION
                " " STATE-ERROR
        WHEN STATE-USPS-CODE (STATE-INDEX) = CUSTOMER-USPS-STATE
            MOVE STATE-NUM TO STATE-INDEX.
    ADD 1 TO STATE-INDEX.
    GO TO SEARCH-LOOP.
SEARCH-END.
    SEARCH NAME-ENTRY
        AT END
            DISPLAY " Table full"
            MOVE 1 TO NAME-INDEX
            PERFORM SHOW-TABLE 8 TIMES
            EXIT
        WHEN LAST-NAME (NAME-INDEX) = CUSTOMER-NAME
            ADD 1 TO NAME-COUNT (NAME-INDEX)
        WHEN LAST-NAME (NAME-INDEX) = SPACES
            MOVE CUSTOMER-NAME TO LAST-NAME (NAME-INDEX)
            MOVE 1 TO NAME-COUNT (NAME-INDEX).
    SET COURSE-INDEX TO 5.
    SET COURSE-INDEX UP BY 1.
    SET COURSE-INDEX DOWN BY DECREMENT-VALUE.
    SET SOPHOMORE TO TRUE
    SET REPORT-RUN TO OFF.
    SET POINTER-VAR TO REFERENCE OF Z(I,J,K).
    SET RETURN-STATUS TO FAILURE.
    sort tabl descending elem-item2 elem-item3.
    sort tabl2 descending elem-item1 of group2
        sequence alph-2
        input procedure proc-1 through proc-2
        giving file-1 file-2 file-3.
    start file-name KEY GREATER THAN OR EQUAL key-data
        ALLOWING READERS
        INVALID
            MOVE CUSTOMER-NAME TO LAST-NAME (NAME-INDEX)
    END-START
    STOP RUN
    STOP "ass"
    STOP SPACE.
    STRING CIVIL-TITLE DELIMITED BY " "
        " " DELIMITED BY SIZE
        FIRST-NAME DELIMITED BY " "
        " " DELIMITED BY SIZE
        LAST-NAME DELIMITED BY SIZE
        INTO TEXT-STRING.
    STRING CITY DELIMITED BY "/"
        ", " DELIMITED BY SIZE
        STATE DELIMITED BY SIZE
        " " DELIMITED BY SIZE
        ZIP DELIMITED BY SIZE
        INTO TEXT-STRING.
* =================================
    MOVE 0 TO LINE-COUNT.
    MOVE 1 TO PTR.
GET-WORD.
    IF LINE-COUNT NOT < 4
        DISPLAY " " TEXT-STRING
        GO TO GOT-WORDS.
    ACCEPT INPUT-MESSAGE.
    DISPLAY INPUT-MESSAGE.
SAME-WORD.
    MOVE PTR TO HOLD-PTR.
    STRING INPUT-MESSAGE DELIMITED BY SPACE
        ", " DELIMITED BY SIZE
        INTO TEXT-STRING
            WITH POINTER PTR
        ON OVERFLOW
            STRING " " DELIMITED BY SIZE
                INTO TEXT-STRING
                    WITH POINTER HOLD-PTR
            DISPLAY " " TEXT-STRING
            MOVE SPACES TO TEXT-STRING
            ADD 1 TO LINE-COUNT
            MOVE 1 TO PTR
            GO TO SAME-WORD.
    GO TO GET-WORD.
GOT-WORDS.
    EXIT.
* ===================================
    SUBTRACT 2 ITEMB FROM ITEMA.
    SUBTRACT 14 FROM ITEMA, ITEME
        ON SIZE ERROR
            MOVE 0 TO ITEMB.
    SUBTRACT 14 FROM ITEMA
        ON SIZE ERROR
            MOVE 9 TO ITEMB.
        NOT ON SIZE ERROR
            MOVE 1 TO ITEMB.
    SUBTRACT 1 FROM ITEMB ITEMD (ITEMB).
    SUBTRACT ITEME ITEMD (ITEMB) FROM ITEMA
        GIVING ITEMB.
    SUBTRACT 10 ITEMB FROM ITEMD (ITEMB)
        ON SIZE ERROR
            MOVE 0 TO ITEMA
    END-SUBTRACT.
    IF ITEMB < 3 AND > 1
        SUBTRACT 1 FROM ITEMD(ITEMB)
            ON SIZE ERROR
            MOVE 0 TO ITEMA
        END-SUBTRACT
        DISPLAY 'yes'
    ELSE
        DISPLAY 'no'.
    SUBTRACT 1, A, B FROM ITEMA ROUNDED, ITEN-B.
*****
    SUPPRESS PRINTING
    SUPPRESS
    TERMINATE report-name1 report-name2
    UNLOCK file-name1 RECORDS
    UNLOCK file-name2 ALL
    UNLOCK file-name3
*****
    UNSTRING INMESSAGE
        DELIMITED BY "-" OR "/" OR ALL " "
            INTO THEMONTH DELIMITER IN HOLD-DELIM
                 THEDAY   DELIMITER IN HOLD-DELIM
                 THEYEAR  DELIMITER IN HOLD-DELIM
        ON OVERFLOW MOVE ALL "0" TO THEDATE.
    INSPECT THEDATE REPLACING ALL " " BY "0".
*
    WRITE RECORD-OUT
        FROM FUNCTION UPPER-CASE(NAME-FIELD).
    WRITE REPORT-REC AFTER STARTING-NEW-FORM.
    WRITE rec-name
        ALLOWING NO OTHERS
        BEFORE advance-num LINES
        END-OF-PAGE
            EXIT
        NOT EOP
            CONTINUE
            DISPLAY "Continue!"
    END-WRITE
END PROGRAM.

IDENTIFICATION DIVISION.
PROGRAM-ID. RMSSPECREGS.
*
* This program demonstrates the use of RMS special registers to
* implement a different recovery for each of several errors with RMS files.
*
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
SELECT OPTIONAL EMP-FILE ASSIGN "SYS$DISK:ART.DAT".
SELECT REPORT-FILE ASSIGN "SYS$OUTPUT".
DATA DIVISION.
FILE SECTION.
FD EMP-FILE VALUE OF ID IS VAL-OF-ID.
01 EMP-RECORD.
    02 EMP-ID PIC 9(7).
    02 EMP-NAME PIC X(15).
    02 EMP-ADDRESS PIC X(30).
FD REPORT-FILE REPORT IS RPT.
WORKING-STORAGE SECTION.
01 VAL-OF-ID PIC X(20).
01 RMS$_EOF PIC S9(9) COMP VALUE EXTERNAL RMS$_EOF.
01 SS$_BADFILENAME PIC S9(9) COMP VALUE EXTERNAL SS$_BADFILENAME.
01 RMS$_FNF PIC S9(9) COMP VALUE EXTERNAL RMS$_FNF.
01 RMS$_DNF PIC S9(9) COMP VALUE EXTERNAL RMS$_DNF.
01 RMS$_DEV PIC S9(9) COMP VALUE EXTERNAL RMS$_DEV.
01 D-DATE PIC 9(6).
01 EOF-SW PIC X.
    88 E-O-F VALUE "E".
    88 NOT-E-O-F VALUE "N".
01 VAL-OP-SW PIC X.
    88 VALID-OP VALUE "V".
    88 OP-FAILED VALUE "F".
01 OP PIC X.
    88 OP-OPEN VALUE "O".
    88 OP-CLOSE VALUE "C".
    88 OP-READ VALUE "R".
REPORT SECTION.
RD RPT PAGE 26 LINES HEADING 1 FIRST DETAIL 5.
01 TYPE IS PAGE HEADING.
    02 LINE IS PLUS 1.
        03 COLUMN 1 PIC X(16) VALUE "Emplyee File on".
        03 COLUMN 18 PIC 99/99/99 SOURCE D-DATE.
    02 LINE IS PLUS 2.
        03 COLUMN 2 PIC X(5) VALUE "Empid".
        03 COLUMN 22 PIC X(4) VALUE "Name".
        03 COLUMN 43 PIC X(7) VALUE "Address".
        03 COLUMN 60 PIC X(4) VALUE "Page".
        03 COLUMN 70 PIC ZZ9 SOURCE PAGE-COUNTER.
01 REPORT-LINE TYPE IS DETAIL.
    02 LINE IS PLUS 1.
        03 COLUMN IS 1 PIC 9(7) SOURCE EMP-ID.
        03 COLUMN IS 20 PIC X(15) SOURCE IS EMP-NAME.
        03 COLUMN IS 42 PIC X(30) SOURCE IS EMP-ADDRESS.
PROCEDURE DIVISION.
DECLARATIVES.
USE-SECT SECTION.
USE AFTER STANDARD ERROR PROCEDURE ON EMP-FILE.
CHECK-RMS-SPECIAL-REGISTERS.
    SET OP-FAILED TO TRUE.
    EVALUATE RMS-STS OF EMP-FILE TRUE
    WHEN (RMS$_EOF) OP-READ
    SET VALID-OP TO TRUE
    SET E-O-F TO TRUE
    WHEN (SS$_BADFILENAME) OP-OPEN
    WHEN (RMS$_FNF) OP-OPEN
    WHEN (RMS$_DNF) OP-OPEN
    WHEN (RMS$_DEV) OP-OPEN
    DISPLAY "File cannot be found or file spec is invalid"
    DISPLAY RMS-FILENAME OF EMP-FILE
    DISPLAY "Enter corrected file (control-Z to STOP RUN): "
    WITH NO ADVANCING
    WHEN ANY OP-CLOSE
    CONTINUE
    WHEN ANY RMS-STS OF EMP-FILE IS SUCCESS
    SET VALID-OP TO TRUE
    WHEN OTHER
    IF RMS-STV OF EMP-FILE NOT = ZERO
    THEN
    CALL "LIB$STOP" USING
    BY VALUE RMS-STS OF EMP-FILE
    END-IF
    END-EVALUATE.
    ALTER PROC-D TO PROC-EE PROC-C TO PROC-AA.
    ACCEPT VAL-OF-ID with conversion
        from line number line-number PLUS 1
        erase to end of screen
        with bell
        protected 
            no blank 
            SIZE 100
        with no echo
        default is current value
        CONTROL KEY IN key-dest-item
    AT END STOP RUN
    NOT AT END 
    END-ACCEPT
    ADD 14 TO ITEMA
    ON SIZE ERROR
        ADD 0 TO ITEMB
    NOT ON SIZE ERROR
        ADD 1 TO ITEMB
END DECLARATIVES.
MAIN-PROG SECTION.
000-DRIVER.
PERFORM 100-INITIALIZE.
PERFORM WITH TEST AFTER UNTIL E-O-F
GENERATE REPORT-LINE
READ EMP-FILE
END-PERFORM.
PERFORM 200-CLEANUP.
STOP RUN.
100-INITIALIZE.
ACCEPT D-DATE FROM DATE.
DISPLAY "Enter file spec of employee file: " WITH NO ADVANCING.
ACCEPT VAL-OF-ID.
PERFORM WITH TEST AFTER UNTIL VALID-OP
SET VALID-OP TO TRUE
SET OP-OPEN TO TRUE
OPEN INPUT EMP-FILE
IF OP-FAILED
THEN
SET OP-CLOSE TO TRUE
CLOSE EMP-FILE
END-IF
END-PERFORM.
OPEN OUTPUT REPORT-FILE.
INITIATE RPT.
SET NOT-E-O-F TO TRUE.
SET OP-READ TO TRUE.
READ EMP-FILE.
200-CLEANUP.
TERMINATE RPT.
SET OP-CLOSE TO TRUE.
CLOSE EMP-FILE REPORT-FILE.

       compute ITEMC in divide-test = 
       (a / b)
*><
              ON SIZE ERROR MOVE 1 to ITEMC in divide-test
              NOT ON SIZE ERROR MOVE 1 to ITEMC in divide-test
       evaluate NOT ITEMC in divide-test + 10 + 100, ITEMA in divide-test < 0
       when NOT 6 through 7, TRUE
              DISPLAY " ITEMC+10 is 6 through 7 and ITEMA < 0"
       when NOT 6 through 7, FALSE
              DISPLAY " ITEMC+10 is 6 through 7 and ITEMA >= 0"
       when other
              DISPLAY " ITEMC+10 is other" ITEMC in divide-test CONVERSION
       end-evaluate
       EVALUATE ITEMA
       WHEN "A01" 
                     MOVE 1 TO ITEMB
       WHEN "A02" THRU "C16" 
                     MOVE 2 TO ITEMB
       WHEN "C20" THRU "L86" 
                     MOVE 3 TO ITEMB
       WHEN "R20"    ADD 1 TO R-TOT
                     GO TO PROC-A
       WHEN OTHER 
                     MOVE 0 TO ITEMB
       END-EVALUATE .
       EVALUATE      LOW-STOK      WEEK-USE      LOC-VNDR      ON-ORDER
       WHEN          "Y",          16 THRU 999,  ANY,          "N" GO TO RUSH-ORDER depending on ass in hole of world
       WHEN          "Y",          16 THRU 999,  ANY,          "Y" GO TO NORMAL-ORDER
       WHEN          "Y",          8 THRU 15,    "N",          "N" GO TO RUSH-ORDER
       WHEN          "Y",          8 THRU 15,    "N",          "Y" GO TO NORMAL-ORDER
       WHEN          "Y",          8 THRU 15,    "Y",          "N" GO TO NORMAL-ORDER
       WHEN          "Y",          0 THRU 7,     ANY,          "N" GO TO NORMAL-ORDER
       WHEN          "N",          ANY,          ANY,          "Y" GO TO CANCEL-ORDER
       END-EVALUATE.

       IF ITEMA > 10
              IF ITEMA = ITEMC
                     MOVE "X" TO ITEMB
              ELSE
                     MOVE "Y" TO ITEMB
       ELSE
              GO TO PROC-A.
       IF ITEMA < 10 OR > 20
              NEXT SENTENCE
       ELSE
              MOVE "X" TO ITEMB.
       IF ZERO < function VARIANCE * test-1 AND >= 20
              MOVE "X" TO ITEMB.
       IF ITEMA is not ZERO AND less than 10
              MOVE "X" TO ITEMB
       ELSE
              GO TO PROC-A.
       ADD 1 to item in qqq.

       INITIALIZE ITEMA REPLACING ALPHANUMERIC-EDITED BY "ABCD"
              
       initiate rd-1 rd-2

       INSPECT ITEMA TALLYING COUNT1 FOR LEADING "L" BEFORE "A",
*><
              COUNT2 FOR LEADING "A" BEFORE "L"
*       replace ==alpha== by ==NUM-1== ==num== by ==ALPHA-1==.
       INSPECT ITEMA TALLYING COUNT1 FOR ALL "L" "R"
              REPLACING LEADING "A" BY "E" AFTER INITIAL "L"
       INSPECT ITEMA REPLACING ALL "X" BY "Y", "B" BY "Z",
                     "W" BY "Q" AFTER "R".
       INSPECT ITEMA REPLACING CHARACTERS BY "B" BEFORE "A".
       INSPECT ITEMA CONVERTING "SIR" TO "DTA" AFTER QUOTE BEFORE "@".

       merge in-file DESCENDING in-file-key in in-file-struct 
              COLLATING SEQUENCE IS alpha-ebcdic
              using in-file
              OUTPUT PROCEDURE IS first-pro THROUGH end-pro
\b              giving out-file
\b         NOT ON ERROR MOVE 1 to A
       replace ==alpha== by ==NUM-1== ==num== by ==ALPHA-1==.

\b           examine ass in qqq tallying until first space replacing by "a".
\b           EXHIBIT changed (LIN + 1, 5) "ass" 
\b                           (LIN + 2, 5) space
\b                           (LIN + 3, 5) erase
\b              upon file-out.

\b       ENTRY 'point-1' 
\b              using by value ass in the of world
\b                    by reference hole of fame
\b              repeated 1 to 5
\b              returning result-code.


END PROGRAM RMSSPECREGS.