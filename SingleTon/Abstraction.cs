using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp15
{
    abstract class Shape
    {

      public abstract int area();
    }


    class Square : Shape
    {


        private int side;


        public Square(int x = 0)
        {
            side = x;
        }


        public override int area()
        {
            Console.Write("Area of Square: ");
            return (side * side);
        }
    }
}
