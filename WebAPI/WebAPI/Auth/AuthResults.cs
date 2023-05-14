namespace WebAPI.Auth
{
    public class AuthResults
    {
        public string Token { get; set; }
        public bool Result { get; set; }
        public List<String> Errors { get; set; }
    }
}
