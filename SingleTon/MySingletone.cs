using System;
using System.Collections.Generic;
using System.Text;

namespace ConsoleApp15
{
    public class Foobar
    {
        private int i;
        public int I
        {
            get { return i; }
            set { i = value; }
        }
        private static Foobar numInstances ;

        public static Foobar CreateFoobar()
        {
            if (numInstances==null)
            {
                numInstances=new Foobar();
                return numInstances;
            }

            return null;
        }

        //private Foobar(Foobar o)
        //{
        //    I = o.I;
        //}
        //protected Foobar()
        //{
        //    Console.WriteLine("my name");
        //}
    }
}
