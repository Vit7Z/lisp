;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// редактирование двойных позиционных обозначений               //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:04-numbering-continued

( / adoc crnt-num digit dlt-smbl filler lft-part pos-start sel-txt-old sel-txt-typ slc-txt slc-txt-type smbl-tmp start-num str-mask str-new str-tmp txt-string)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object)))) ; start undo

(setvar "cmdecho" 1)

(setq slc-txt (entget (car (entsel "\nВыберите начальное поз. обозначение\n")))
			slc-txt-type (cdr (assoc 0 slc-txt))
			txt-string (cdr (assoc 1 slc-txt))
			pos-start 1
			str-mask ""
);setq

(repeat (strlen txt-string)
	(setq smbl-tmp (substr txt-string pos-start 1)
				pos-start (+ pos-start 1)
	);setq
	
	(cond 
		((= smbl-tmp "=") (setq str-tmp "="));=
	
		((= smbl-tmp "+") (setq str-tmp "+"));if
		
		((= smbl-tmp ".") (setq str-tmp "."));if
		
		((= smbl-tmp "-") (setq str-tmp "-"));if
	
		((wcmatch smbl-tmp "#") (setq str-tmp "#"));if
	
		((wcmatch smbl-tmp "@") (setq str-tmp "@"));if
	);cond
	
	(setq str-mask (strcat str-mask str-tmp));setq
);repeat


(cond
	((or (= str-mask "#")
			 (= str-mask "#-#")
			 (= str-mask "##-#")
			 (= str-mask "###-#")
			 (= str-mask "####-#")
			 (= str-mask "#-@#")			  
			 (= str-mask "#-@@#")
			 (= str-mask "@#")
			 (= str-mask "@#-#")
			 (= str-mask "@##-#")
			 (= str-mask "@@-@#")
			 (= str-mask "@@#")
			 (= str-mask "@@#-#")
			 (= str-mask "@@##-#")
			 (= str-mask "@@#.#")
			 (= str-mask "@@##.#")
			 (= str-mask "@@@#")	
			 (= str-mask "@@@-#")
			 (= str-mask "@@@@#")		 			 
			 (= str-mask "+##-#")
			 (= str-mask "-##-#")
			 (= str-mask "=#-#")
			  (= str-mask "=##-#")
			 (= str-mask "=####-#"));or
		(setq digit 1));=
				
		((or (= str-mask "##")
				 (= str-mask "=##")
				 (= str-mask "@##")
				 (= str-mask "@@##")
				 (= str-mask "@@@##")
				 (= str-mask "@@##-##")
				 (= str-mask "@@@@##")
				 (= str-mask "+##-##")
				 (= str-mask "#-@@##"));or
		(setq digit 2));=

		((or (= str-mask "###")
				 (= str-mask "=###")
				 (= str-mask "@###")
				 (= str-mask "@@###")
				 (= str-mask "@@@###")
				 (= str-mask "@@@@###"));or
			(setq digit 3));=

		((or (= str-mask "####")
				 (= str-mask "@####")
				 (= str-mask "@@####")
				 (= str-mask "-####")
				 (= str-mask "=####")
				 (= str-mask "+####")
				 (= str-mask "#-@@####")
				 (= str-mask "##-@@####"));or
		(setq digit 4));=

);cond

;;;;;;; разделяем текст на левую часть (постоянная) и номер
(setq lft-part (substr txt-string 1 (- (strlen txt-string) digit)) ;левая постоянная часть
			start-num (atoi (substr txt-string (+ (- (strlen txt-string) digit) 1))) ;номер начальный
			
			slc-txt nil
			crnt-num (1+ start-num)
);setq

(while (/= nil (setq slc-txt (entget (car (entsel "\nВыберите поз. обозначение\n")))))

	;;;;;;;формируем наполнитель, если число меньше числа цифр в номере
	(setq dlt-smbl (- digit (strlen (itoa crnt-num))));setq
	
	(cond 
		((= dlt-smbl 0) (setq filler ""));=
		
		((< dlt-smbl 0) (setq filler ""));=
		
		((= dlt-smbl 1) (setq filler "0"));=
		
		((= dlt-smbl 2) (setq filler "00"));=
		
		((= dlt-smbl 3) (setq filler "000"));=
	);if

	(setq str-new (strcat lft-part filler (itoa crnt-num)) ;новая строка
				str-new (cons 1 str-new)
				
				sel-txt-typ (cdr (assoc 0 slc-txt))
				sel-txt-old (assoc 1 slc-txt)
				
				slc-txt (subst str-new sel-txt-old slc-txt)	;заменяем старую строку новой
				
				start-num crnt-num
				crnt-num (1+ crnt-num)
	);setq
	
	(entmod slc-txt)	;обновляем данные примитива
);while

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(gc)
(princ)
)
;/////// *************************************************************//////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              //////////////////////////////
;/////// *************************************************************//////////////////////////////








