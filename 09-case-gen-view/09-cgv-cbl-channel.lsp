;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// рисование кабель-каналов на ОВШ                             ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 09-cgv-cbl-channel

( / adoc cntr-1 dcl-id jstfy list-01 list-02 lst-channel lst-lst-channel)
(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "ltype" "acad_iso04w100" t) nil)
  (command "_.linetype" "_l" "acad_iso04w100" "acadiso.lin" "")
);if

(setq list-01 (list "25" "40" "60" "80" "100")
			list-02 (list "Сторона" "Cередина")
      lst-lst-channel nil
      cntr-1 0 ;счетчик, номер элемента в списке
);setq

(if (< (setq dcl-id (load_dialog "dia-09-cgv-cbl-channel.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_09_cbl_channel" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(set_tile "txt-01" "0")
(set_tile "txt-02" "0")

(action_tile "but1"
  (strcat "(setq lst-channel (get_tile \"txt-01\"))"
  				"(setq jstfy (get_tile \"txt-02\"))"
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

(setq jstfy (nth (atoi jstfy) list-02));setq

(cond 
	((= jstfy "Сторона") (side-09-cgv-cbl-channel lst-channel));=
	((= jstfy "Cередина") (mdl-09-cgv-cbl-channel lst-channel));=
);if

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////////////////////////////////// конец программы //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;рисуем по сстороне                         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun side-09-cgv-cbl-channel

(lst-channel / angl cntr-1 dlt drct hlf-dlt pnt-1 pnt-2 pnt-drct str-alrt tmp-lst-channel xpnt-1 xpnt-2 xpnt-drct ypnt-1 ypnt-2 ypnt-drct)

(setq lst-channel (strcat "(" lst-channel ")");преобразуем строку в список
			lst-channel (read lst-channel)
			cntr-1 0
);setq

(repeat (length lst-channel)
	(setq tmp-lst-channel (nth (nth cntr-1 lst-channel) list-01); для поля "выбрано"
				str-alrt (strcat "Ширина " tmp-lst-channel "мм")
	);setq
	(alert str-alrt)

	(cond 
		((= tmp-lst-channel "25") (setq dlt 2.5 hlf-dlt 1.25));=
		((= tmp-lst-channel "40") (setq dlt 4 hlf-dlt 2));=
		((= tmp-lst-channel "60") (setq dlt 6 hlf-dlt 3));=
		((= tmp-lst-channel "80") (setq dlt 8 hlf-dlt 4));=
		((= tmp-lst-channel "100") (setq dlt 10 hlf-dlt 5));=
	);if
	
	(while (/= (setq pnt-1 (getpoint "\nУкажите точку 1\n")) nil)

		(setq pnt-2 (getpoint "\nУкажите точку 2\n")
					xpnt-1 (nth 0 pnt-1)
		  		ypnt-1 (nth 1 pnt-1)
					xpnt-2 (nth 0 pnt-2)
		  		ypnt-2 (nth 1 pnt-2)
		  		angl (atoi (angtos (angle pnt-1 pnt-2)))
		);setq

		(setq pnt-drct (getpoint "\nУкажите точку направления\n")
					xpnt-drct (nth 0 pnt-drct)
					ypnt-drct (nth 1 pnt-drct)		
		);setq

		(if (and (<= angl 135) (>= angl 45));вверх
			(cond
				((< xpnt-1 xpnt-drct) (setq drct "up-rght"));=
				((> xpnt-1 xpnt-drct) (setq drct "up-lft"))
			);cond
		);if

		(if (and (<= angl 315) (>= angl 225));вниз
			(cond
				((< xpnt-1 xpnt-drct) (setq drct "dwn-rght"));=
				((> xpnt-1 xpnt-drct) (setq drct "dwn-lft"))
			);cond
		);if

		(if (or (>= angl 315) (<= angl 45));вправо
			(cond
				((< ypnt-1 ypnt-drct) (setq drct "rght-up"));=
				((> ypnt-1 ypnt-drct) (setq drct "rght-dwn"))
			);cond
		);if

		(if (and (>= angl 135) (<= angl 225));влево
			(cond
				((< ypnt-1 ypnt-drct) (setq drct "lft-up"));=
				((> ypnt-1 ypnt-drct) (setq drct "lft-dwn"))
			);cond
		);if

		(if (= drct "up-rght")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list (+ xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (+ xpnt-1 hlf-dlt) (- ypnt-1 3)) (list (+ xpnt-1 hlf-dlt) (+ ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (= drct "up-lft")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list (- xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (- xpnt-1 hlf-dlt) (- ypnt-1 3)) (list (- xpnt-1 hlf-dlt) (+ ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (= drct "dwn-rght")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list (+ xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (+ xpnt-1 hlf-dlt) (+ ypnt-1 3)) (list (+ xpnt-1 hlf-dlt) (- ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (= drct "dwn-lft")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list (- xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (- xpnt-1 hlf-dlt) (+ ypnt-1 3)) (list (- xpnt-1 hlf-dlt) (- ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if
		
		;///////////////////////////////////////////////////////////////////////////////////////////////////////////
		(if (= drct "rght-up")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list xpnt-2 (+ ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (- xpnt-1 3) (+ ypnt-1 hlf-dlt)) (list (+ xpnt-2 3) (+ ypnt-1 hlf-dlt)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if
		
		(if (= drct "rght-dwn")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list xpnt-2 (- ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (- xpnt-1 3) (- ypnt-1 hlf-dlt)) (list (+ xpnt-2 3) (- ypnt-1 hlf-dlt)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (= drct "lft-up")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list xpnt-2 (+ ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (+ xpnt-1 3) (+ ypnt-1 hlf-dlt)) (list (- xpnt-2 3) (+ ypnt-1 hlf-dlt)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (= drct "lft-dwn")
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" pnt-1 (list xpnt-2 (- ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (+ xpnt-1 3) (- ypnt-1 hlf-dlt)) (list (- xpnt-2 3) (- ypnt-1 hlf-dlt)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if
		
	);while
	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
);repeat


(princ)
)
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;рисуем по середине                         //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun mdl-09-cgv-cbl-channel

(lst-channel / angl cntr-1 dlt pnt-1 pnt-2 str-alrt tmp-lst-channel xpnt-1 xpnt-2 ypnt-1 ypnt-2)

(setq lst-channel (strcat "(" lst-channel ")");преобразуем строку в список
			lst-channel (read lst-channel)
			cntr-1 0
);setq

(repeat (length lst-channel)
	(setq tmp-lst-channel (nth (nth cntr-1 lst-channel) list-01); для поля "выбрано"
				str-alrt (strcat "Ширина " tmp-lst-channel "мм")
	);setq
	(alert str-alrt)
	
	(cond 
		((= tmp-lst-channel "25") (setq dlt 1.25));=
		((= tmp-lst-channel "40") (setq dlt 2));=
		((= tmp-lst-channel "60") (setq dlt 3));=
		((= tmp-lst-channel "80") (setq dlt 4));=
		((= tmp-lst-channel "100") (setq dlt 5));=
	);if
	
	(while (/= (setq pnt-1 (getpoint "\nУкажите точку 1\n")) nil)
		(setq pnt-2 (getpoint "\nУкажите точку 2\n")
					xpnt-1 (nth 0 pnt-1)
		  		ypnt-1 (nth 1 pnt-1)
					xpnt-2 (nth 0 pnt-2)
		  		ypnt-2 (nth 1 pnt-2)
		  		angl (atoi (angtos (angle pnt-1 pnt-2)))
		);setq

		(if (and (<= angl 135) (>= angl 45));вверх
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" (list (- xpnt-1 dlt) ypnt-1) (list (+ xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list xpnt-1 (- ypnt-1 3)) (list xpnt-1 (+ ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (and (<= angl 315) (>= angl 225));вниз
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" (list (- xpnt-1 dlt) ypnt-1) (list (+ xpnt-1 dlt) ypnt-2))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list xpnt-1 (+ ypnt-1 3)) (list xpnt-1 (- ypnt-2 3)) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (or (>= angl 315) (<= angl 45));вправо
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" (list xpnt-1 (- ypnt-1 dlt)) (list xpnt-2 (+ ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (- xpnt-1 3) ypnt-1) (list (+ xpnt-2 3) ypnt-1) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if

		(if (and (>= angl 135) (<= angl 225));влево
			(progn
				(setvar "CELWEIGHT" 40)
				(setvar "osmode" 0)
				(command "_rectangle" (list xpnt-1 (- ypnt-1 dlt)) (list xpnt-2 (+ ypnt-1 dlt)))
				(setvar "CELWEIGHT" -1)
				(setvar "celtype" "acad_iso04w100")
				(setvar "celtscale" 0.4)
				(command "_line" (list (+ xpnt-1 3) ypnt-1) (list (- xpnt-2 3) ypnt-1) "")
				(setvar "celtscale" 1)
				(setvar "celtype" "Bylayer")
				(setvar "osmode" 6199)
			);progn
		);if
	);while
	(setq cntr-1 (1+ cntr-1);счетчик
	);setq
);repeat
(princ)
)
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


