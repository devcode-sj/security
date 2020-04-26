using System;
using System.Text;

using System.Collections.Generic;

namespace ConsoleApp15
{




    class Program
    {
        private static int Check_Prime(int number)
        {
            int i;
            for (i = 2; i <= number - 1; i++)
            {
                if (number % i == 0)
                {
                    return 0;
                }
            }
            if (i == number)
            {
                return 1;
            }
            return 0;
        }

        public  static  void    Main(string[] args)
        {


            int i = 6;
            int j = i % 2;
            Console.WriteLine(j);
          

         


            Console.ReadLine();

          
          


         


          

        }
        class CompanyDescription
        {

            public string CompanyName;
            public string Owner;
            public CompanyDescription(string c, string o)
            {
                this.CompanyName = c;
                this.Owner = o;
            }
        }
        class Company
        {

            public int GBRank;
            public CompanyDescription desc;

            public Company(int gbRank, string c,
                                       string o)
            {
                this.GBRank = gbRank;
                desc = new CompanyDescription(c, o);
            }

            // method for cloning object 
            public object Shallowcopy()
            {
                return this.MemberwiseClone();
            }

            // method for cloning object 
            public Company DeepCopy()
            {
                Company deepcopyCompany = new Company(this.GBRank,
                                    desc.CompanyName, desc.Owner);
                return deepcopyCompany;
            }
            public static void CountString(string ST)
            {
                int count = 0;
                for (int i = ST.Length - 1; i >= 0; i--)
                {

                    count++;

                }
                Console.WriteLine(count);







            }
            // revers string 
            public static void ReversString(string ST)
            {
                string result = "";
                for (int i = ST.Length - 1; i >= 0; i--)
                {

                    result += ST[i];

                }
                Console.WriteLine(result);







            }



            //check if two Strings are anagrams of each other?
            public static void Anagram(string s, string b)
            {
                char[] str1 = s.ToLower().ToCharArray();
                char[] str2 = b.ToLower().ToCharArray();
                Array.Sort(str1);
                Array.Sort(str2);

                string fn1 = new string(str1);
                string fn2 = new string(str2);
                if (fn1 == fn2)
                {
                    Console.WriteLine("Match");
                }
                else
                {
                    Console.WriteLine("Not Match");
                }


            }


            //duplicate remove from string
            public static string duplicatev(string s)
            {
                string NewString = "";

                for (int i = 0; i < s.Length; i++)
                {
                    if (!NewString.Contains(s[i]))
                    {

                        NewString += s[i];
                    }

                }
                return NewString;


            }



        }


    }
}













             




