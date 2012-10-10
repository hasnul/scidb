//----------------------------------------------------------------------------
// Anti-Grain Geometry (AGG) - Version 2.5
// A high quality rendering engine for C++
// Copyright (C) 2002-2006 Maxim Shemanarev
// Contact: mcseem@antigrain.com
//          mcseemagg@yahoo.com
//          http://antigrain.com
//
// AGG is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// AGG is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with AGG; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
// MA 02110-1301, USA.
//----------------------------------------------------------------------------

#ifndef AGG_ELLIPSE_INCLUDED
#define AGG_ELLIPSE_INCLUDED

#include "agg_basics.h"
#include <math.h>

namespace agg
{

    //----------------------------------------------------------------ellipse
    class ellipse
    {
    public:
        ellipse() :
            m_x(0.0), m_y(0.0), m_rx(1.0), m_ry(1.0), m_scale(1.0),
            m_num(4), m_step(0), m_cw(false) {}

        ellipse(double x, double y, double rx, double ry,
                unsigned num_steps=0, bool cw=false);

        void init(double x, double y, double rx, double ry,
                  unsigned num_steps=0, bool cw=false);

        void approximation_scale(double scale);
        void rewind(unsigned path_id);
        unsigned vertex(double* x, double* y);

    private:
        void calc_num_steps();

        double m_x;
        double m_y;
        double m_rx;
        double m_ry;
        double m_scale;
        unsigned m_num;
        unsigned m_step;
        bool m_cw;
    };

    //------------------------------------------------------------------------
    inline void ellipse::calc_num_steps()
    {
        double ra = (fabs(m_rx) + fabs(m_ry)) / 2;
        double da = acos(ra / (ra + 0.125 / m_scale)) * 2;
        m_num = uround(2*pi / da);
    }

    //------------------------------------------------------------------------
    inline ellipse::ellipse(double x, double y, double rx, double ry,
                unsigned num_steps, bool cw) :
            m_x(x), m_y(y), m_rx(rx), m_ry(ry), m_scale(1.0),
            m_num(num_steps), m_step(0), m_cw(cw)
    {
        if(m_num == 0) calc_num_steps();
    }

    //------------------------------------------------------------------------
    inline void ellipse::init(double x, double y, double rx, double ry,
                              unsigned num_steps, bool cw)
    {
        m_x = x;
        m_y = y;
        m_rx = rx;
        m_ry = ry;
        m_num = num_steps;
        m_step = 0;
        m_cw = cw;
        if(m_num == 0) calc_num_steps();
    }

    //------------------------------------------------------------------------
    inline void ellipse::approximation_scale(double scale)
    {
        m_scale = scale;
        calc_num_steps();
    }

    //------------------------------------------------------------------------
    inline void ellipse::rewind(unsigned)
    {
        m_step = 0;
    }

    //------------------------------------------------------------------------
    inline unsigned ellipse::vertex(double* x, double* y)
    {
        if(m_step == m_num)
        {
            ++m_step;
            return path_cmd_end_poly | path_flags_close | path_flags_ccw;
        }
        if(m_step > m_num) return path_cmd_stop;
        double angle = double(m_step) / double(m_num) * 2.0 * pi;
        if(m_cw) angle = 2.0 * pi - angle;
        *x = m_x + cos(angle) * m_rx;
        *y = m_y + sin(angle) * m_ry;
        m_step++;
        return ((m_step == 1) ? path_cmd_move_to : path_cmd_line_to);
    }

}



#endif

