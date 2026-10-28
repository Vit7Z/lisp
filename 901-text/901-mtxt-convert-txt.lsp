;///////////////////////////////////// преобразование нескольких однострочных текстов //////////////////////////////////////////////////////////////////////////////////////////
;///////////////////////////////////// в один многострочный текст            ///////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:901-mtxt-convert-txt

( / adoc counter crnt-prmtv-ttxt current-primitive data-primitive lngth-set-primitive p11-c p12-c set-primitive ttxt ttxt-height ttxt-layer txt-1 txt-point xpins-crnt ypins-crnt)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo


(setvar	"OSMODE" 0)

(prompt "\nВыберите прибор\n")

(setq	set-primitive (ssget '((0 . "circle")))
			lngth-set-primitive (sslength set-primitive) ; количество элементов в наборе
);setq

(setq	counter 0);setq

(repeat	lngth-set-primitive
  (setq	current-primitive	(ssname set-primitive counter)
				data-primitive (entget current-primitive) ;получаем данные текущего примитива
				xpins-crnt (nth 1 (assoc 10 (entget current-primitive)));точка вставки круга
				ypins-crnt (nth 2 (assoc 10 (entget current-primitive)))
	);setq
	
  (setq	p11-c (list (+ xpins-crnt 2) (+ ypins-crnt 2));cекущая рамка
  			p12-c (list (- xpins-crnt 2) (- ypins-crnt 2))
	);setq
	  
  (setq	crnt-prmtv-ttxt (ssget "_C" p11-c p12-c '((0 . "*TEXT")));верхний текст
 				ttxt (cdr (assoc 1 (entget (ssname crnt-prmtv-ttxt 0))));извлекаем данные из текстов
 				ttxt-height (cdr (assoc 40 (entget (ssname crnt-prmtv-ttxt 0))))
 				ttxt-layer	(cdr (assoc 8 (entget (ssname crnt-prmtv-ttxt 0))))
  );setq
  
  (command "_erase" (ssname crnt-prmtv-ttxt 0) "")
  
  (if (wcmatch ";" ttxt)
  	(setq ttxt (substr ttxt (+ (vl-string-search ";" ttxt) 2)));setq
  );if

  (if (wcmatch ";" ttxt)
  	(setq ttxt (substr ttxt (+ (vl-string-search ";" ttxt) 2)));setq
  );if

  (if (wcmatch "}" ttxt)
  	(setq ttxt (vl-string-right-trim "}" ttxt));setq
  );if

	(setq txt-point (list xpins-crnt ypins-crnt));setq

	(setq txt-1
		(entmakex
			(list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				(cons 10 txt-point) ; нач точка текста
				(cons 11 txt-point) ; нач точка текста
				(cons 1 ttxt) ; содержание текста
				(cons 8 ttxt-layer) ; содержание текста
				(cons 40 ttxt-height) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				'(72 . 1) ; гориз выравнивание текста
				'(73 . 2) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				 (cons 7 (getvar "textstyle")) ; стиль текста
			);list
		);entmakex
	);setq

  (setq	counter (+ counter 1));счетчик
);repeat

(vla-endundomark adoc)
(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(setvar "orthomode" 1)
(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////
