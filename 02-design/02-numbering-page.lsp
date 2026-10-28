;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// нумерация листов проекта                              ///////////////////////////////////////////////
;/////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:02-numbering-page

( / adoc counter counter1 crnt-block crnt-obj crnt-pnt dlt-x-1 dlt-x-2 dlt-x-3 dlt-y-1 dlt-y-2 dlt-y-3 
len-of-set list-pnt name-block-for-del name-crnt-block num-1 num-2 obj p1 p2 pnt-1 pnt-2 pnt-crnt-block 
set-blocks start-num txt-h x-crnt-pnt x-pnt-crnt-block y-crnt-pnt y-pnt-crnt-block)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(setq start-num (atoi (getstring "\nВведите начальный номер\n"))
      obj 1
);setq

;формируем нобор и оставляем в нем только объекты форматов
(setq pnt-1 (getpoint "\nУкажите точку")
      pnt-2 (getpoint "\nУкажите точку") 
      
      set-blocks (ssget "_W" pnt-1 pnt-2 '((0 . "INSERT")))
      len-of-set (sslength set-blocks)
		  counter 0
);setq

;;;;оставляем в наборе только блоки штампов
(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks counter))
        name-block-for-del (ssname set-blocks counter)
        name-crnt-block (cdr (assoc 2 crnt-block))
  );setq
  
  (if (/= (substr name-crnt-block 1 6) "штамп-")
    (setq set-blocks (ssdel name-block-for-del set-blocks)
          counter (- counter 1)
    );setq
  );if
  
  (setq counter (+ counter 1));setq
);repeat
  
;;;;из набора штампов удаляем штампы спецификаций, овш, эчни
(setq len-of-set (sslength set-blocks)
		  counter 0
);setq
  
(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks counter))
        name-block-for-del (ssname set-blocks counter)
        name-crnt-block (cdr (assoc 2 crnt-block))
  );setq
  
  (if (/= (vl-string-search "спцф" name-crnt-block) nil)
    (setq set-blocks (ssdel name-block-for-del set-blocks)
          counter (- counter 1)
    );setq
  );if
  
  (if (/= (vl-string-search "эчни" name-crnt-block) nil)
    (setq set-blocks (ssdel name-block-for-del set-blocks)
          counter (- counter 1)
    );setq
  );if
  
  (if (/= (vl-string-search "гип" name-crnt-block) nil)
    (setq set-blocks (ssdel name-block-for-del set-blocks)
          counter (- counter 1)
    );setq
  );if
  
  (setq counter (+ counter 1));setq
);repeat

;создаем списки по икс и игрек
(setq	len-of-set (sslength set-blocks)
		  counter 0
		  list-pnt (list "")	  
);setq

(repeat len-of-set
  (setq	crnt-block (entget (ssname set-blocks counter))
        name-crnt-block (cdr (assoc 2 crnt-block))
        pnt-crnt-block (cdr (assoc 10 crnt-block))
  
  			list-pnt (vl-list* pnt-crnt-block list-pnt)
				counter (+ counter 1));setq
);repeat

(setq list-pnt (vl-remove "" list-pnt));setq

;сортируем по возрастанию х
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (< (nth 0 num-1) (nth 0 num-2))))));setq

;сортируем по убыванию y
(setq list-pnt (vl-sort list-pnt (function (lambda (num-1 num-2) (> (nth 1 num-1) (nth 1 num-2))))));setq

;расставляем цифры
(setq	counter1 0);setq

(repeat (length list-pnt)
  (setq crnt-pnt (nth counter1 list-pnt)
        x-crnt-pnt (nth 0 crnt-pnt)
        y-crnt-pnt (nth 1 crnt-pnt)
        pnt-crnt-block 0
        counter 0
  );setq

  (repeat len-of-set
    (setq	crnt-block (entget (ssname set-blocks counter))
          name-crnt-block (cdr (assoc 2 crnt-block))
          pnt-crnt-block (cdr (assoc 10 crnt-block))
          x-pnt-crnt-block (nth 0 pnt-crnt-block)
          y-pnt-crnt-block (nth 1 pnt-crnt-block)     
    );setq
    (if (and (= x-crnt-pnt x-pnt-crnt-block)
             (= y-crnt-pnt y-pnt-crnt-block));and
      (progn
 
        ;параметры штампа 15мм
			 (if (or (= (substr name-crnt-block 1 15) "штамп-15мм-спдс")
			 				 (= (substr name-crnt-block 1 15) "штамп-15мм-ескд"))
			 
				 (setq dlt-x-1 -2
							 dlt-x-2 -8
							 dlt-y-1 5
							 dlt-y-2 3
							 ;для создания текста
							 dlt-x-3 -5
							 dlt-y-3 4
							 txt-h 3.5
				 );setq
			 );if
			 			 
			 ;параметры штампа 55мм
			 (if (or (= (substr name-crnt-block 1 15) "штамп-55мм-спдс")
			 			   (= (substr name-crnt-block 1 15) "штамп-55мм-ескд"))
				(setq dlt-x-1 -21
							 dlt-x-2 -33
							 dlt-y-1 23
							 dlt-y-2 20
							 ;для создания текста
							 dlt-x-3 -27.5
							 dlt-y-3 20
							 txt-h 3.5
				 );setq
			 );if
			 
			 (setq p1 (list (+ x-pnt-crnt-block dlt-x-1) (+ y-pnt-crnt-block dlt-y-1));точки секущей линии
						 p2 (list (+ x-pnt-crnt-block dlt-x-2) (+ y-pnt-crnt-block dlt-y-2))
						 crnt-obj (ssget "_C" p1 p2 '((0 . "*text")))
			 );setq
			 			 
			 (if (/= crnt-obj nil) 
			   (command "_erase" crnt-obj "")
			 );if
			 
			 (command "_text" "_MC" (list (+ x-pnt-crnt-block dlt-x-3) (+ y-pnt-crnt-block dlt-y-3)) txt-h 0 (+ counter1 start-num))
			 (setvar "osmode" 0)  
       );progn
    );if
    (setq counter (+ counter 1));setq
  );repeat

  (setq counter1 (+ counter1 1));setq
);repeat


(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(vla-endundomark adoc)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////