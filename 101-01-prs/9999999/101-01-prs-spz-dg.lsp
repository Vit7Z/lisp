;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-press-sens-spz-dg

( / adoc dcl-id list-01 list-02 list-03 list-1001 list-1001-read-file list-901 list-902 list-902-read-file list-99 type-list)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-901 nil
      list-902 nil
      list-902-read-file nil
      list-1001-read-file nil
);setq

(read-file-for-dialog-box-01 "101-01-press-sens-spz-dg.txt")

(divide-text-into-parts-02-list-text list-1001-read-file 60)

(setq list-01 (cdr (assoc 1 list-902-read-file))
			list-02 (cdr (assoc 2 list-902-read-file))
			list-03 (cdr (assoc 3 list-902-read-file))
			list-1001 list-1001-read-file
);setq


(if (< (setq dcl-id (load_dialog "dia-101-01-press-sens-spz-dg.dcl")) 0) ;ищем диалог
		(progn
			(alert "Ќе найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens_spz_dg" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-1001" list-1001)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")
(set_tile "txt-03" "0")

(action_tile "but1"
  (strcat "(tmp-filling-fields-101-01-press-sens-spz-dg)");strcat
);action_tile

(action_tile "but2"
  (strcat "(setq type-list \"le\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "but3"
  (strcat "(setq type-list \"spcf\")"
          "(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(if (= type-list "le") (tmp-le-101-01-press-sens-spz-dg));if

(if (= type-list "spcf") (tmp-spcf-101-01-press-sens-spz-dg));if

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////  ќЌ≈÷ ѕ–ќ√–јћћџ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма формировани€ данных/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-filling-fields-101-01-press-sens-spz-dg

( / str-01 str-02 str-03 str-902 swtch)

;заполн€ем поле "выбрано"
(setq str-01 (nth (atoi (get_tile "txt-01")) list-01)
			str-02 (nth (atoi (get_tile "txt-02")) list-02)
			str-03 (nth (atoi (get_tile "txt-03")) list-03)
);setq

(if (/= swtch nil) (setq list-902 (reverse list-902)));if

(setq str-902 (list (cons 1 str-01) (cons 2 str-02) (cons 3 str-03) (cons 99 "0,7"))
  		list-902 (vl-list*  str-902 list-902);список характеристик дл€ спецификации
  		
  		list-901 (vl-list* (strcat str-01 "   "
  															 str-02 "кѕа   "
  															 str-03) list-901)
);setq


(setq list-902 (reverse list-902));setq

(list-filling "txt-901" (reverse list-901))

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в ѕЁ                   //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-le-101-01-press-sens-spz-dg

( / cntr-1 pnt-ins str-01 str-02 str-tmp str-txt str-txt-01)

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\n”кажите точку вставки\n"));setq
	
	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq str-txt (strcat "“€гонапоромер показывающий сигнализирующий " str-01 ", пределы показаний " str-02 "кѕа")
				str-txt-01 nil
	);setq
	
	(split-str-parts-le-110-01 str-txt str-txt-01 pnt-ins)
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;подпрограмма вывода в спцф                   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun tmp-spcf-101-01-press-sens-spz-dg

( / cntr-1 dlt-y nmbr-ln pnt-ins str-01 str-011 str-012 str-02 str-021 str-03 str-031 str-99 str-tmp str-txt x-pnt-ins y-pnt-ins y-pnt-ins-1)

(setvar "textstyle" "Standard")

(setq cntr-1 0);setq

(repeat (length list-902)
	(setq str-tmp (nth cntr-1 list-902)
				str-01 (cdr (assoc 1 str-tmp))
				str-02 (cdr (assoc 2 str-tmp))
				str-03 (cdr (assoc 3 str-tmp))

				str-99 (cdr (assoc 99 str-tmp))
	);setq

	(setvar "osmode" 6199)
	
	(setq pnt-ins		(getpoint "\n”кажите точку вставки\n")
				x-pnt-ins (nth 0 pnt-ins)
				y-pnt-ins (nth 1 pnt-ins)
				y-pnt-ins-1 y-pnt-ins
				dlt-y 8
	);setq
	
	(101-empt-lin-spcf)

	;;;;;;;///////////////////////////////////////////////////////////////////////////////////////////
	(setq nmbr-ln 4);setq
			
	(1000-delete-items-spcf nmbr-ln pnt-ins)
	(1000-delete-items-spcf-crtf nmbr-ln pnt-ins)
	
	(setq str-011 (substr str-01 1 (vl-string-search " " str-01))
				str-012 (substr str-01 (+ (vl-string-search "(" str-01) 1))				
				str-021 (substr str-02 2 (- (vl-string-search "." str-02) 1))			
				str-031 (substr str-03 1 (vl-string-search " " str-03))
				str-txt (strcat str-011 "-" str-021 "кѕа-" str-031)
	);setq
	
	(command "_text" "_ML" (list (+ x-pnt-ins 1) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "“€гонапоромер")
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 (strcat "- пределы показаний " str-02 "кѕа, климатическое исп. " str-03))
	(command "_text" "_ML" (list (+ x-pnt-ins 5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 (strcat "- показывающий, сигнализирующий " str-012))
	;
	(split-str-parts-spcf-60-01 str-txt "“” 311-00227471.038-94" pnt-ins);
		
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "ќјќ \"—аранский")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 1)) 4)) 2.5 0 "приборостроительный")
	(command "_text" "_MC" (list (+ x-pnt-ins 247.5) (- (- y-pnt-ins (* dlt-y 2)) 4)) 2.5 0 "завод\", г.—аранск")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 280) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 "шт.")
	;
	(command "_text" "_MC" (list (+ x-pnt-ins 322.5) (- (- y-pnt-ins (* dlt-y 0)) 4)) 2.5 0 str-99);масса
	;
	(print-number-certificate "13950-94" pnt-ins)
	
	(repeat nmbr-ln
		(command "_insert" "зс-пуста€-строка" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 (list x-pnt-ins y-pnt-ins-1))
		(setq y-pnt-ins-1 (- y-pnt-ins-1 8));setq
	);repeat

	(setq cntr-1 (+ cntr-1 1));setq
);repeat

(princ)
)
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
