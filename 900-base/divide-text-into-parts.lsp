;/////// ************************************************************ /////////////////////////
;///////                                                              /////////////////////////
;/////// ************************************************************ /////////////////////////
(defun divide-text-into-parts

(txt-string piece-length / cntr list-900-tmp strlen-900 str-tmp type-txt)

(setq type-txt (type txt-string)	
			list-900-tmp ""		
			cntr 0
);setq

;;;;;;; преобразование списка в строку
(if (= type-txt 'LIST)
	(progn
		(setq txt-string (reverse txt-string));setq
			
		(repeat (length txt-string)
			(setq str-tmp (nth cntr txt-string)
						list-900-tmp (strcat str-tmp " " list-900-tmp)
						cntr (1+ cntr)
			);setq
		);repeat
	);progn

	(setq list-900-tmp txt-string);setq
);if

(setq strlen-900 (strlen list-900-tmp));setq

(if (< strlen-900 piece-length)
	(setq list-900-read-file (list list-900-tmp));setq
	
	(divide-text-into-parts-01-str-text list-900-tmp piece-length)
);if

;(cond
;	;((= (type txt-string) 'STR) (divide-text-into-parts-01-str-text txt-string piece-length));=
;	((= (type txt-string) "SYM") (divide-text-into-parts-01-str-text txt-string piece-length));=
;	((= (type txt-string) 'LIST) (divide-text-into-parts-02-list-text txt-string piece-length));=
;);cond

(gc)
(princ)
)
;/////// *************************************************************/////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              /////////////////////////
;/////// ************************************************************ /////////////////////////


;/////// ************************************************************ /////////////////////////
;///////                                                              /////////////////////////
;/////// ************************************************************ /////////////////////////
(defun divide-text-into-parts-01-str-text

(list-900-tmp piece-length / cntr-1 len-list-900-tmp list-txt num-rpt pos-1 pos-cut prt-lft 
smbl-tmp)

(setq len-list-900-tmp (strlen list-900-tmp)
			list-txt nil			
			cntr-1 1 ;счетчик повторений
			pos-1 1			
			pos-cut nil			
			num-rpt (fix (/ len-list-900-tmp piece-length))
);setq

(repeat num-rpt
	(repeat piece-length
		(setq smbl-tmp (substr list-900-tmp pos-1 1));setq
			
		(if (= smbl-tmp " ") 
		  (setq pos-cut pos-1)
		);if
	
		(setq pos-1 (+ pos-1 1));setq
	);repeat
	
	(setq prt-lft (substr list-900-tmp 1 pos-cut) ;часть строки от первого смвола до крайне правого символа " "
				
			 	list-txt (vl-list* prt-lft list-txt)

				list-900-tmp (substr list-900-tmp (+ pos-cut 1))

				pos-1 1
				
				pos-cut nil
	);setq
);repeat

(setq list-txt (vl-list* list-900-tmp list-txt)
			list-900-read-file (reverse list-txt)
);setq

(gc)
(princ)
)
;/////// ************************************************************ /////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              /////////////////////////
;/////// *************************************************************/////////////////////////