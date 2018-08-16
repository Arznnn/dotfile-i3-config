#!/bin/bash
export R_LIBS_SITE=${R_LIBS_SITE-'/usr/lib/R/library:/usr/local/lib/R/site-library:/usr/lib/R/site-library'}
export PATH="/usr/local/lib/R-devel/bin:$PATH"
R "$@"
