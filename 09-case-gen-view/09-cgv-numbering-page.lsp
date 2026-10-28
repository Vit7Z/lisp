;/////// ************************************************************ ////////////////////////////////////////
;/////// нумерация спецификации                                       ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
(defun c:09-cgv-numbering-page

( / adoc cntr-1 cntr-2 crnt-block crnt-pnt digit-str len-of-set list-pnt name-block-for-del name-crnt-block 
num-1 num-2 pnt-1 pnt-2 pnt-crnt-block set-blocks start-num swtch x-crnt-pnt x-pnt-crnt-block y-crnt-pnt 
y-pnt-crnt-block)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

;формируем нобор и оставляем в нем только объекты форматов
(setq pnt-1 (getpoint "\nУкажите левую точку")
      pnt-2 (getpoint "\nУкажите правую точку") 
);setq

(setq	set-blocks (ssget "_W" pnt-1 pnt-2 '((0 . "INSERT")))
      len-of-set (sslength set-blocks)
		  cntr-1 0

		  digit-str nil
		  swtch nil
		  start-num 1
);setq

;формируем набор и оставляем в нем только блоки штампов
(repeat len-of-set
  (setq crnt-block (entget (ssname set-blocks cntr-1))
        name-block-for-del (ssname set-blocks cntr-1)
        name-crnt-block (cdr (assoc 2 crnt-block))
  );setq

  (if (not (wcmatch name-crnt-block "штамп-*"))
    (setq set-blocks (ssdel name-block-for-del set-blocks)
          cntr-1 (- cntr-1 1)
    );setq
  );if

  (setq cntr-1 (+ cntr-1 1));setq
);repeat


;создаем списки по икс и игрек
(setq	len-of-set (sslength set-blocks)
		  list-pnt (list "")	 
		  cntr-1 0 
);setq

(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks cntr-1))
        name-crnt-block (cdr (assoc 2 crnt-block))
        pnt-crnt-block (cdr (assoc 10 crnt-block))
        
        list-pnt (vl-list* pnt-crnt-block list-pnt)
        
        cntr-1 (+ cntr-1 1)
  );setq
);repeat

(setq list-pnt (vl-remove "" list-pnt));setq

;сортируем по возрастанию х
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2)))));vl-sort
);setq

;сортируем по убыванию y
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (> (nth 1 num-1) (nth 1 num-2)))));vl-sort
);setq


;расставляем цифры
(setq	cntr-1 0);setq

(repeat (length list-pnt)
  (setq crnt-pnt (nth cntr-1 list-pnt)
        x-crnt-pnt (nth 0 crnt-pnt)
        y-crnt-pnt (nth 1 crnt-pnt)
        pnt-crnt-block 0
        cntr-2 0
  );setq
  
  (repeat len-of-set
    (setq	crnt-block (entget (ssname set-blocks cntr-2))
          name-crnt-block (cdr (assoc 2 crnt-block))
          pnt-crnt-block (cdr (assoc 10 crnt-block))
          x-pnt-crnt-block (nth 0 pnt-crnt-block)
          y-pnt-crnt-block (nth 1 pnt-crnt-block)
          
          cntr-2 (+ cntr-2 1)    
    );setq
    
    (if (and (= x-crnt-pnt x-pnt-crnt-block)
             (= y-crnt-pnt y-pnt-crnt-block));and
      (progn         
        (if (wcmatch name-crnt-block "штамп-55мм-спдс-*")
          (09-cgv-numbering-page-stamp-55mm-spds len-of-set x-pnt-crnt-block y-pnt-crnt-block)
        );if
      
        (if (wcmatch name-crnt-block "штамп-15мм-спдс-*")
          (09-cgv-numbering-page-stamp-15mm-spds cntr-1 x-pnt-crnt-block y-pnt-crnt-block)
        );if
      );progn
    );if
  );repeat len-of-set

 (setq cntr-1 (+ cntr-1 1));setq
);repeat

(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////


;/////// ************************************************************ ////////////////////////////////////////
;/////// редактирование штампа 55мм СПДС                              ////////////////////////////////////////
(defun 09-cgv-numbering-page-stamp-55mm-spds 
  (cntr-1 x-pnt-crnt-block y-pnt-crnt-block / crnt-obj dlt-x-1 dlt-x-2 dlt-x-3 dlt-y-1 dlt-y-2 dlt-y-3 p1 p2 txt-h)

  (setq dlt-x-1 -1
				dlt-x-2 -19
				dlt-y-1 24
				dlt-y-2 16
				;для создания текста
				dlt-x-3 -10
				dlt-y-3 20
				txt-h 3.5
													
				p1 (list (+ x-pnt-crnt-block dlt-x-1) (+ y-pnt-crnt-block dlt-y-1));точки секущей линии
				p2 (list (+ x-pnt-crnt-block dlt-x-2) (+ y-pnt-crnt-block dlt-y-2))
						 			
				crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
	);setq
							
	(if (/= crnt-obj nil)
	  (command "_erase" crnt-obj "")
	);if
	
	(if (/= cntr-1 1)
	  (command "_text" "_MC" (list (+ x-pnt-crnt-block dlt-x-3) (+ y-pnt-crnt-block dlt-y-3)) txt-h 0 cntr-1)
  );if
(princ)
)
;/////// КОНЕЦ ПОДПРОГРАММЫ                                           ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////


;/////// ************************************************************ ////////////////////////////////////////
;/////// редактирование штампа 15мм СПДС                              ////////////////////////////////////////
(defun 09-cgv-numbering-page-stamp-15mm-spds 
  (cntr-1 x-pnt-crnt-block y-pnt-crnt-block / crnt-obj dlt-x-1 dlt-x-2 dlt-x-3 dlt-y-1 dlt-y-2 dlt-y-3 p1 p2 txt-h)
 
  (setq dlt-x-1 -2
				dlt-x-2 -8
				dlt-y-1 5
				dlt-y-2 3
				;для создания текста
				dlt-x-3 -5
				dlt-y-3 4
				txt-h 3.5
									
				p1 (list (+ x-pnt-crnt-block dlt-x-1) (+ y-pnt-crnt-block dlt-y-1));точки секущей линии
				p2 (list (+ x-pnt-crnt-block dlt-x-2) (+ y-pnt-crnt-block dlt-y-2))
						 			
				crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
	);setq
						
	(if (/= crnt-obj nil) (command "_erase" crnt-obj ""));if
						
	(command "_text" "_MC" (list (+ x-pnt-crnt-block dlt-x-3) (+ y-pnt-crnt-block dlt-y-3)) txt-h 0 (+ cntr-1 1))

(princ)
)
;/////// КОНЕЦ ПОДПРОГРАММЫ                                           ////////////////////////////////////////
;/////// *************************************************************////////////////////////////////////////