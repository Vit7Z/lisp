;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// требования к ноутбуку в СПЦФ                                ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-01-sec-dev-notebook-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 type-list-01 type-list-02 type-list-03 type-list-04 type-list-05 type-list-06 type-list-07)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo



(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq type-list-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq type-list-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq type-list-04 (nth (atoi (get_tile \"txt-04\")) list-04))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq type-list-05 (nth (atoi (get_tile \"txt-05\")) list-05))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-06"
  (strcat "(setq type-list-06 (nth (atoi (get_tile \"txt-06\")) list-06))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-07"
  (strcat "(setq type-list-07 (nth (atoi (get_tile \"txt-07\")) list-07))"
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

(cond
	((= type-list-01 "Элметро") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-elmetro.lsp") (101-01-secondary-device-elmetro));=
	((= type-list-01 "Regigraf") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-regigraf.lsp") (101-01-secondary-device-regigraf));=

	
);cond

(cond
	((= type-list-02 "2ТРМ1, Овен") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-2trm1.lsp") (101-01-secondary-device-2trm1));=
	((= type-list-02 "ТРМ12, Овен") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-2trm1.lsp") (101-01-secondary-device-trm12));=
	((= type-list-02 "ТРМ32, Овен") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-2trm1.lsp") (101-01-secondary-device-trm32));=
	((= type-list-02 "but-122") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-elemer.lsp") (101-01-secondary-device-elemer));=

	
);cond

(cond
	((= type-list-03 "but-131") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-logika.lsp") (101-secondary-device-logika));=

	
);cond

(cond
	((= type-list-04 "but-111") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-elmetro.lsp") (101-01-secondary-device-elmetro));=

	
);cond

(cond
	((= type-list-05 "but-111") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-elmetro.lsp") (101-01-secondary-device-elmetro));=


);cond

(cond
	((= type-list-06 "but-111") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-elmetro.lsp") (101-01-secondary-device-elmetro));=

	
);cond

(cond
	((= type-list-07 "Ноутбук в ЗС") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-notebook.lsp") (101-01-sec-dev-notebook-01-general));=
	((= type-list-07 "Софт") (load "d:\\mcloud\\my-sprt\\101-01-secondary-device\\101-01-secondary-device-soft-general.lsp") (101-01-secondary-device-soft-general));=
	
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////