;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// штамп 15 для других программ                                 //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun 101-00-spcf-stamp-15mm

(block-name / adoc index-base index-spcf lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 rctn-1 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 
rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 str-base txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8)

(setvar	"cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq str-base (substr block-name (+ (vl-string-search "спдс-" block-name) 6));имя блока штампа окрч
      index-base (substr str-base (+ (vl-string-search "-" str-base) 2))
      str-base (substr str-base 1 (+ (vl-string-search "-" str-base) 0))	
      str-base (strcase str-base)		
			index-base (substr index-base 1 (vl-string-search "-" index-base))
			
			index-spcf (substr block-name (+ (vl-string-search "спцф-" block-name) 6))
			str-base (strcat str-base "." index-base ".С" index-spcf)
);setq

(setvar "textstyle" "Standard")

(if (= (tblsearch "block" block-name ) nil)
	(progn
		(setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
 		(command "_RECTANGLE" '(-185 15) '(-175 5))
		(setq rctn-1 (entlast))
 		(command "_RECTANGLE" '(-185 5) '(-175 0))
		(setq rctn-2 (entlast))	
		(command "_RECTANGLE" '(-175 15) '(-165 5))	
		(setq rctn-3 (entlast))
		(command "_RECTANGLE" '(-175 5) '(-165 0))
		(setq rctn-4 (entlast))
		(command "_RECTANGLE" '(-165 15) '(-155 5))
		(setq rctn-5 (entlast))
		(command "_RECTANGLE" '(-165 5) '(-155 0))
		(setq rctn-6 (entlast))
		(command "_RECTANGLE" '(-155 15) '(-145 5))
		(setq rctn-7 (entlast))
    (command "_RECTANGLE" '(-155 5) '(-145 0))
		(setq rctn-8 (entlast))
		(command "_RECTANGLE" '(-145 15) '(-130 5))
		(setq rctn-9 (entlast))
		(command "_RECTANGLE" '(-145 5) '(-130 0))
		(setq rctn-10 (entlast))
		(command "_RECTANGLE" '(-130 15) '(-120 5))
		(setq rctn-11 (entlast))
		(command "_RECTANGLE" '(-130 5) '(-120 0))
		(setq rctn-12 (entlast))
		(command "_RECTANGLE" '(-120 15) '(-10 0))
		(setq rctn-13 (entlast))
		(command "_RECTANGLE" '(-10 15) '(0 8))
		(setq rctn-14 (entlast))
		(command "_RECTANGLE" '(-10 8) '(0 0))
		(setq rctn-15 (entlast))
		
		(setvar "CELWEIGHT" -1)
		(command "_.line" '(-185 10) '(-175 10) "")
		(setq lin-1 (entlast))
		(command "_.line" '(-175 10) '(-165 10) "")
		(setq lin-2 (entlast))
		(command "_.line" '(-165 10) '(-155 10) "")
		(setq lin-3 (entlast))
		(command "_.line" '(-155 10) '(-145 10) "")
		(setq lin-4 (entlast))
		(command "_.line" '(-145 10) '(-130 10) "")
		(setq lin-5 (entlast))
		(command "_.line" '(-130 10) '(-120 10) "")
		(setq lin-6 (entlast))
		
		(setvar "textstyle" "Standard")
		(command "_text" "_MC" (list -180 2.5) 2.5 0 "Изм.")
		(setq txt-1 (entlast));setq
		(command "_text" "_MC" (list -170 2.5) 2.5 0 "Кол.уч.")
		(setq txt-2 (entlast));setq
		(command "_text" "_MC" (list -160 2.5) 2.5 0 "Лист")
		(setq txt-3 (entlast));setq
		(command "_text" "_MC" (list -150 2.5) 2.5 0 "№ док.")
		(setq txt-4 (entlast));setq
		(command "_text" "_MC" (list -137.5 2.5) 2.5 0 "Подпись")
		(setq txt-5 (entlast));setq
		(command "_text" "_MC" (list -125 2.5) 2.5 0 "Дата")
		(setq txt-6 (entlast));setq
		
		(setq txt-7
		  (entmakex
			  (list
					'(0 . "TEXT")
					'(100 . "AcDbEntity")
					'(100 . "AcDbText")
					'(10 -65 7.5) 
					'(11 -65 7.5) 
					(cons 1 str-base);текст
					'(8 . "wspom") 
					'(40 . 3.5);высота
					'(41 . 1) 
					'(50 . 0) 
					'(72 . 1) 
					'(73 . 2) 
					'(370 . -1)  
			  );list
		  );entmakex
		);setq
		
    (command "_text" "_MC" (list -5 11.5) 2.5 0 "Лист")
		(setq txt-8 (entlast));setq
		
	  (command "_block" block-name '(0 0) 
	    rctn-1 rctn-2 rctn-3 rctn-4 rctn-5 rctn-6 rctn-7 rctn-8 rctn-9 rctn-10 rctn-11 rctn-12 rctn-13 rctn-14 rctn-15 
  		lin-1 lin-2 lin-3 lin-4 lin-5 lin-6	
  		txt-1 txt-2 txt-3 txt-4 txt-5 txt-6 txt-7 txt-8 "")
  );progn
);if


(vla-endundomark adoc)
(setvar	"ORTHOMODE" 1)
(setvar	"OSMODE" 6199)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
