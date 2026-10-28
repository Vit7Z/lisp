;;; ///////////////////////////////////////////////// оформление перечня элементов ///////////////////////
(defun c:101-01-gas-detection-01-general

( / adoc dcl-id type-list)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);undo

(setq list-01 (list "ИГС-98 Клевер-СВ")
);setq

(setq list-02 (list "ИГС-98 Верба-Д")
);setq

(setq list-03 (list "******")
);setq


(if (< (setq dcl-id (load_dialog "dia-101-01-gas-detection-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_gas_detection" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)

(list-filling "txt-02" list-02)

(list-filling "txt-03" list-03)

(action_tile "but-11"
  (strcat "(setq type-list \"but-11\")"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "but-12"
  (strcat "(setq type-list \"but-12\")"
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

(if (= type-list "but-11")
	(101-gas-meter-spg)
);if

(if (= type-list "but-12")
	(101-gas-meter-sg-ek)
);if

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////
