#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright 2022 Barry Duggan.
#
# SPDX-License-Identifier: GPL-3.0-or-later
#


import numpy
from gnuradio import gr

class dr_box(gr.sync_block):
    """
    docstring for block dr_box
    """
    def __init__(self):
        gr.sync_block.__init__(self,
            name="dr_box",
            in_sig=None,
            out_sig=None)

