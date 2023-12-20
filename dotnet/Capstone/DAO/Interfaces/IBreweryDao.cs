using System.Collections.Generic;
using Capstone.Models;

namespace Capstone.DAO.Interfaces
{
    public interface IBreweryDao
    {
        public Brewery CreateBrewery(Brewery brewery);
        public IList<Brewery> GetBreweries();
        public Brewery GetBreweryById(int id);
        public Brewery UpdateBrewery(Brewery updatedBrewery);
        
        //public Brewery GetBreweryByname(string name);*/
    }
}
